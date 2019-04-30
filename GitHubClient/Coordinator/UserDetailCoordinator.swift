//
//  UserDetailCoordinator.swift
//  GitHubClient
//
//  Created by ichi on 2019/04/30.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import UIKit
import SafariServices

class UserDetailCoordinator: Coordinator {
    
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController = UINavigationController()
    var user: UserEntity
    
    init(navigationController: UINavigationController, user: UserEntity) {
        self.navigationController = navigationController
        self.user = user
    }
    
    func start() {
        let viewController = UserDetailViewController(nibName: UserDetailViewController.className, bundle: nil)
        viewController.setSelectedUserUrl(url: self.user.url!)
        viewController.setSelectedUserRepositoryUrl(url: self.user.reposUrl!)
        viewController.coordinator = self
        self.navigationController.pushViewController(viewController, animated: true)         
    }

    func webPage(htmlUrl: String?) {
        let url = URL(string: htmlUrl!)!
        let safariViewController = SFSafariViewController(url: url)
        self.navigationController.present(safariViewController, animated: true, completion: nil)
    }
    
}
