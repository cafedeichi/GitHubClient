//
//  BaseNavigationController.swift
//  GitHubClient
//
//  Created by ichi on 2019/06/23.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import UIKit

protocol BaseNavigationControllerDelegate: class {
    func didSelectCustomBackAction()
}

class BaseNavigationController: UINavigationController {
    
    // MARK: - Delegates
    
    weak var backActionDelegate: BaseNavigationControllerDelegate?
    
    // MARK: Back button customization
    
    private var backButtonImage: UIImage?
    private var backButtonTitle: String?
    private var backButtonfont: UIFont?
    private var backButtonTitleColor: UIColor?
    private var backButtonTintColor: UIColor?
    private var shouldUseViewControllerTitles = false
    
    // MARK: - Public methods
    
    func customizeBackButton(backButtonImage: UIImage? = nil,
                             backButtonTitle: String? = nil,
                             backButtonfont: UIFont? = nil,
                             backButtonTitleColor: UIColor? = nil,
                             backButtonTintColor: UIColor? = nil,
                             shouldUseViewControllerTitles: Bool = false) {
        self.backButtonImage = backButtonImage
        self.backButtonTitle = backButtonTitle
        self.backButtonfont = backButtonfont
        self.backButtonTitleColor = backButtonTitleColor
        self.backButtonTintColor = backButtonTintColor
        self.shouldUseViewControllerTitles = shouldUseViewControllerTitles
        
    }
    
    func customizeTitle(titleColor: UIColor,
                        largeTextFont: UIFont,
                        smallTextFont: UIFont,
                        isTranslucent: Bool = true,
                        barTintColor: UIColor? = nil,
                        prefersLargeTitles: Bool = true) {
        self.navigationBar.prefersLargeTitles = prefersLargeTitles
        UINavigationBar.customStyle(color: titleColor,
                                    largeTextFont: largeTextFont,
                                    smallTextFont: smallTextFont,
                                    isTranslucent: isTranslucent,
                                    barTintColor: barTintColor)
    }
    
    // MARK: - Overrides
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        self.setupCustomBackButton(viewController: viewController)
    }
    
    // MARK: - Private methods
    
    private func setupCustomBackButton(viewController: UIViewController) {
        if self.backButtonImage != nil || self.backButtonTitle != nil {
            viewController.navigationItem.hidesBackButton = true
            let backButtonTitle = self.shouldUseViewControllerTitles ? self.viewControllers[self.viewControllers.count - 2].title : self.backButtonTitle
            let button = UIButton.customBackButton(backButtonImage: self.backButtonImage, backButtonTitle: backButtonTitle, backButtonfont: self.backButtonfont, backButtonTitleColor: self.backButtonTitleColor, backButtonTintColor: self.backButtonTintColor)
            button.addTarget(self, action: #selector(actionBack(sender:)), for: .touchUpInside)
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
    
    // MARK: - Actions
    
    @objc private func actionBack(sender: UIBarButtonItem) {
        self.backActionDelegate?.didSelectCustomBackAction()
    }

}
