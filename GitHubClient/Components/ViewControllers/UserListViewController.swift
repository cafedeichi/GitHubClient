//
//  UserListViewController.swift
//  GitHubClient
//
//  Created by ichi on 2019/02/23.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import UIKit
import ReSwift
import KRProgressHUD
import PullToRefresh

class UserListViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?

    @IBOutlet weak var userListTableView: UITableView!

    fileprivate let refresher = PullToRefresh()
    
    fileprivate var rowHeight: CGFloat!

    fileprivate var since: Int = 0

    fileprivate var userList: [UserEntity] = [] {
        didSet {
            self.userListTableView.reloadData()
            self.userListTableView.endAllRefreshing()
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
        self.userListTableView.removeAllPullToRefresh()
    }

    fileprivate func prepare() {
        
        self.navigationItem.title = "GitHub Users"
        
        self.userListTableView.delegate = self
        self.userListTableView.dataSource = self
        
        let nib = UINib(nibName: UserListItemCell.className, bundle: nil)
        self.rowHeight = (nib.instantiate(withOwner: self, options: nil)[0] as! UserListItemCell).frame.size.height
        self.userListTableView.registerCustomCell(UserListItemCell.self)        
        
        self.userListTableView.rowHeight = self.rowHeight
        self.userListTableView.separatorColor = UIColor.clear
        
        self.userListTableView.addPullToRefresh(refresher) {
            UserListActionCreator.fetchUserList(since: self.since, refresh: true)
        }

        UserListActionCreator.fetchUserList(since: self.since)
        
    }
    
}

extension UserListViewController: StoreSubscriber {
    
    func newState(state: AppState) {
        self.isLoading = state.userList.isLoading
        self.since = state.userList.since
        self.userList = state.userList.userList
    }
    
}

extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userList.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCustomCell(with: UserListItemCell.self)
        cell.configureCell(user: self.userList[indexPath.row])
        
        if indexPath.row == self.userList.count - 1 {
            UserListActionCreator.fetchUserList(since: self.since)
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.coordinator?.userDetail(user: self.userList[indexPath.row])
    }
    
}
