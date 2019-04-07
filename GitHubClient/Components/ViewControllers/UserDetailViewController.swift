//
//  UserDetailViewController.swift
//  GitHubClient
//
//  Created by ichi on 2019/02/27.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import UIKit
import ReSwift
import KRProgressHUD
import SafariServices
import PullToRefresh

class UserDetailViewController: UIViewController {

    @IBOutlet weak var userDetailTableView: UITableView!
    
    fileprivate let refresher = PullToRefresh()
    
    fileprivate var backArrowButton: UIBarButtonItem!

    fileprivate var selectedUserUrl: String! = nil
    fileprivate var selectedUserRepositoryUrl: String! = nil

    fileprivate var user: UserEntity! = nil {
        didSet {
            self.userDetailTableView.reloadData()
        }
    }

    fileprivate var repositoryList: [RepositoryEntity] = [] {
        didSet {
            self.userDetailTableView.reloadData()
            self.userDetailTableView.endAllRefreshing()
        }
    }
    
    fileprivate var isLoading: Bool = false {
        didSet {
            if isLoading && !KRProgressHUD.isVisible && refresher.state != .loading {
                    KRProgressHUD.show()
            } else {
                KRProgressHUD.dismiss()
            }
        }
    }
    
    fileprivate var page: Int = 0

    fileprivate var topRowHeight: CGFloat!
    fileprivate var rowHeight: CGFloat!
    fileprivate var headerBaseView: UIView!
    
    fileprivate var sectionView: UserDetailSectionView!
    fileprivate var footerView: UserDetailFooterView!
    fileprivate var tapGesture: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepare()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        store.subscribe(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        store.unsubscribe(self)
    }
    
    deinit {
        self.footerView.removeGestureRecognizer(self.tapGesture)
    }
    
    fileprivate func prepare() {
        
        self.prepareNavigationItems()
        
        let topNib = UINib(nibName: UserDetailItemCell.className, bundle: nil)
        let nib = UINib(nibName: UserRepositoryItemCell.className, bundle: nil)
        self.topRowHeight = (topNib.instantiate(withOwner: self, options: nil)[0] as! UserDetailItemCell).frame.size.height
        self.rowHeight = (nib.instantiate(withOwner: self, options: nil)[0] as!
            UserRepositoryItemCell).frame.size.height
        self.userDetailTableView.registerCustomCell(UserDetailItemCell.self)
        self.userDetailTableView.registerCustomCell(UserRepositoryItemCell.self)
        
        self.sectionView = Bundle.main.loadNibNamed(UserDetailSectionView.className, owner: self, options: nil)?.first as? UserDetailSectionView
        self.footerView = Bundle.main.loadNibNamed(UserDetailFooterView.className, owner: self, options: nil)?.first as? UserDetailFooterView
        self.tapGesture = UITapGestureRecognizer(target: self, action: #selector(UserDetailViewController.viewTapped(_:)))
        self.footerView.addGestureRecognizer(self.tapGesture)
        
        self.userDetailTableView.delegate = self
        self.userDetailTableView.dataSource = self
        self.userDetailTableView.separatorStyle = .none
        self.userDetailTableView.tableFooterView = self.footerView
        
        self.userDetailTableView.addPullToRefresh(refresher) {
            UserDetailActionCreator.fetchUser(url: self.selectedUserUrl!)
            UserDetailActionCreator.fetchRepositoryList(reposUrl: self.selectedUserRepositoryUrl, refresh: true)
        }
        
        UserDetailActionCreator.fetchUser(url: self.selectedUserUrl!)
        UserDetailActionCreator.fetchRepositoryList(reposUrl: self.selectedUserRepositoryUrl)
        
    }
    
    fileprivate func prepareNavigationItems() {
        
        self.navigationItem.title = "User Profile"
        
        self.backArrowButton = UIBarButtonItem(image: UIImage(named: "back"),
                                          style: UIBarButtonItem.Style.plain,
                                          target: self,
                                          action: #selector(UserDetailViewController.barButtonItemTapped(_:)))
        self.backArrowButton.tag = 1
        self.navigationItem.leftBarButtonItems = [backArrowButton]
        
    }
    
    @objc func barButtonItemTapped(_ sender: UIBarButtonItem) {

        switch sender.tag {
        case 1:
            self.navigationController?.popViewController(animated: true)
        default:
            break
        }
        
    }
    
    @objc fileprivate func viewTapped(_ sender: UIGestureRecognizer? = nil) {
        UserDetailActionCreator.fetchRepositoryList(reposUrl: self.selectedUserRepositoryUrl, page: self.page, loadMore: true)
    }
    
    func setSelectedUserUrl(url: String) {
        self.selectedUserUrl = url
    }

    func setSelectedUserRepositoryUrl(url: String) {
        self.selectedUserRepositoryUrl = url
    }

}

extension UserDetailViewController: StoreSubscriber {
    
    func newState(state: AppState) {
        self.isLoading = state.userDetail.isLoading
        self.user = state.userDetail.user
        self.repositoryList = state.userDetail.repositoryList
        self.page = state.userDetail.page
    }
    
}

extension UserDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? self.topRowHeight : self.rowHeight
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? self.topRowHeight : self.rowHeight
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0.0 : self.sectionView.frame.size.height
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return section == 0 ?  nil : self.sectionView
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            if self.user != nil {
                return 1
            }
        } else {
            return self.repositoryList.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCustomCell(with: UserDetailItemCell.self)
            self.headerBaseView = cell.baseView
            cell.configureCell(user: self.user)
            self.sectionView.loginLabel.text = self.user.login
            return cell
        } else {
            let cell = tableView.dequeueReusableCustomCell(with: UserRepositoryItemCell.self)
            cell.configureCell(repository: self.repositoryList[indexPath.row])
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let url = URL(string: self.repositoryList[indexPath.row].htmlUrl!)!
        let safariViewController = SFSafariViewController(url: url)
        self.present(safariViewController, animated: true, completion: nil)
    }
    
}

extension UserDetailViewController {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        guard let baseView = self.headerBaseView, scrollView.contentOffset.y >= 0, scrollView.contentOffset.y <= self.topRowHeight else {
            return
        }
        
        UIView.animate(withDuration: 0.2) {
            baseView.alpha = 1.0 - abs(scrollView.contentOffset.y/self.topRowHeight)
            self.sectionView.loginLabel.alpha = abs(scrollView.contentOffset.y/self.topRowHeight)
        }

    }
    
    fileprivate func setPosition(_ scrollView: UIScrollView) {
        
        UIView.animate(withDuration: 0.3) {
            if scrollView.contentOffset.y > 0 && scrollView.contentOffset.y < self.topRowHeight * 0.5 {
                scrollView.contentOffset = .zero
            } else if scrollView.contentOffset.y >= self.topRowHeight * 0.5 && scrollView.contentOffset.y < self.topRowHeight {
                scrollView.contentOffset.y = self.topRowHeight
            }
        }
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.setPosition(scrollView)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            self.setPosition(scrollView)
        }
    }
    
}