//
//  MainCoordinator.swift
//  GitHubClient
//
//  Created by ichi on 2019/04/14.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

class MainCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController = UINavigationController()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = UserListViewController.instantiate()
        viewController.coordinator = self
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    func userDetail(user: UserEntity) {
        let viewController = UserDetailViewController(nibName: UserDetailViewController.className, bundle: nil)
        viewController.setSelectedUserUrl(url: user.url!)
        viewController.setSelectedUserRepositoryUrl(url: user.reposUrl!)
        viewController.coordinator = self
        self.navigationController.pushViewController(viewController, animated: true)
    }

    func userWebPage(repository: RepositoryEntity) {
        let url = URL(string: repository.htmlUrl!)!
        let safariViewController = SFSafariViewController(url: url)
        self.navigationController.present(safariViewController, animated: true, completion: nil)
    }

}
