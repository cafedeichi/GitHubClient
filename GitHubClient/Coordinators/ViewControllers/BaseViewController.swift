//
//  BaseViewController.swift
//  GitHubClient
//
//  Created by ichi on 2019/06/24.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, CoordinatorNavigationControllerDelegate {
    
    // MARK: - Controller lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Private methods
    
    private func setupNavigationController() {
        if let navigationController = self.navigationController as? CoordinatorNavigationController {
            navigationController.swipeBackDelegate = self
        }
    }
    
    // MARK: - SwipeBackNavigationControllerDelegate
    
    internal func didSelectCustomBackAction() {
        
    }
    
}
