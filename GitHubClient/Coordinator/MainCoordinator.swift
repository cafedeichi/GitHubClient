//
//  MainCoordinator.swift
//  GitHubClient
//
//  Created by ichi on 2019/04/14.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    
    var childCoordinators = [Coordinator]()
    var navigationController = UINavigationController()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        self.navigationController.delegate = self
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

    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in
            childCoordinators.enumerated()
                where coordinator === child {
                    childCoordinators.remove(at: index)
                    break
        }        
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        if let viewController = fromViewController as? UserDetailViewController {
            self.childDidFinish(viewController.coordinator)
        }
    }
}
