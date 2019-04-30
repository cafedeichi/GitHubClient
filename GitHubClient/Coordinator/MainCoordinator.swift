//
//  MainCoordinator.swift
//  GitHubClient
//
//  Created by ichi on 2019/04/14.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import UIKit

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
        let child = UserDetailCoordinator(navigationController: self.navigationController, user: user)
        child.parentCoordinator = self
        self.childCoordinators.append(child)
        child.start()
    }

    func didFinishChild(_ child: Coordinator?) {
        for (index, coordinator) in
            childCoordinators.enumerated()
                where coordinator === child {
                    childCoordinators.remove(at: index)
                    break
        }        
    }
}
