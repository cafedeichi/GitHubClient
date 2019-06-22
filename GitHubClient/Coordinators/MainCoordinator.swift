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
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.tintColor = Assets.tungsten.color
    }
    
    func start() {
        let viewController = UserListViewController(nibName: UserListViewController.className, bundle: nil)
        viewController.coordinator = self
        self.navigationController.setViewControllers([viewController], animated: false)
    }
    
    func userDetail(user: UserEntity) {
        let viewController = UserDetailViewController(nibName: UserDetailViewController.className, bundle: nil)
        viewController.setSelectedUser(user: user)
        viewController.coordinator = self
        self.navigationController.pushViewController(viewController, animated: true)
    }

    func webPage(htmlUrl: String?) {
        let url = URL(string: htmlUrl!)!
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.preferredControlTintColor = Assets.tungsten.color
        self.navigationController.present(safariViewController, animated: true, completion: nil)
    }

}
