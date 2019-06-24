//
//  UINavigationBar.swift
//  GitHubClient
//
//  Created by ichi on 2019/06/23.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import UIKit

extension UINavigationBar {
    
    // MARK: - Public methods
    
    static func customStyle(color: UIColor,
                            largeTextFont: UIFont,
                            smallTextFont: UIFont,
                            isTranslucent: Bool,
                            barTintColor: UIColor?) {
        self.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: largeTextFont]
        self.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: smallTextFont]
        self.appearance().isTranslucent = isTranslucent
        
        if let barTintColor = barTintColor {
            self.appearance().barTintColor = barTintColor
        }
        
    }
    
}
