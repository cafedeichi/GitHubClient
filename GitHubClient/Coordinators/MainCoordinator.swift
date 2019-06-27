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
    
    // MARK: - Vars & Lets
    
    var childCoordinators = [Coordinator]()
    var navigationController: BaseNavigationController

    // MARK: - Init
    
    init(navigationController: BaseNavigationController) {
        self.navigationController = navigationController
        self.customoizeNavigationController()
    }
    
    // MARK: - Private Methods
    
    private func customoizeNavigationController() {
        self.navigationController.customizeTitle(titleColor: Assets.tungsten.color,
                                                 largeTextFont: UIFont.systemFont(ofSize: 32, weight: .semibold),
                                                 smallTextFont: UIFont.systemFont(ofSize: 16, weight: .semibold),
                                                 isTranslucent: true,
                                                 barTintColor: Assets.white.color,
                                                 prefersLargeTitles: true)
        self.navigationController.customizeBackButton(backButtonImage: Assets.back.image,
                                                      backButtonTintColor: Assets.tungsten.color,
                                                      shouldUseViewControllerTitles: true)
    }
    
    // MARK: - Public Methods
    
    func start() {
        let viewController = UserListViewController(nibName: UserListViewController.className, bundle: nil)
        viewController.coordinator = self
        self.navigationController.setViewControllers([viewController], animated: false)
    }
    
    func userDetail(user: UserEntity) {
        let viewController = UserDetailViewController(nibName: UserDetailViewController.className, bundle: nil)
        viewController.setSelectedUser(user: user)
        viewController.coordinator = self
        viewController.onBack = { [unowned self] in
            self.navigationController.popViewController(animated: true)
        }
        self.navigationController.pushViewController(viewController, animated: true)
    }

    func webPage(htmlUrl: String?) {
        let url = URL(string: htmlUrl!)!
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.preferredControlTintColor = Assets.tungsten.color
        self.navigationController.present(safariViewController, animated: true, completion: nil)
    }

}
