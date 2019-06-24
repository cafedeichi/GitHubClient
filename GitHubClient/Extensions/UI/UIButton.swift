//
//  UIButton.swift
//  GitHubClient
//
//  Created by ichi on 2019/06/24.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import UIKit

extension UIButton {
    
    // MARK: - Public methods
    
    static func customBackButton(backButtonImage: UIImage? = nil,
                                 backButtonTitle: String? = nil,
                                 backButtonfont: UIFont? = nil,
                                 backButtonTitleColor: UIColor? = nil) -> UIButton {
        
        let button = UIButton(type: .system)
        
        if let backButtonImage = backButtonImage {
            button.setImage(backButtonImage, for: .normal)
        }
        if let backButtonTitle = backButtonTitle {
            button.setTitle(backButtonTitle, for: .normal)
        }
        if let backButtonfont = backButtonfont {
            button.titleLabel?.font = backButtonfont
        }
        if let backButtonTitleColor = backButtonTitleColor {
            button.setTitleColor(backButtonTitleColor, for: .normal)
        }
        
        button.centerTextAndImage(spacing: 8)
        
        return button
    }
    
    func centerTextAndImage(spacing: CGFloat) {
        let insetAmount = spacing / 2
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -insetAmount, bottom: 0, right: insetAmount)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: -insetAmount)
        contentEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: insetAmount)
    }
    
}
