//
//  UIViewController.swift
//  APIManagerDemo
//
//  Created by Pavle Pesic on 4/11/19.
//  Copyright © 2019 Pavle Pesic. All rights reserved.
//

import UIKit
import KRProgressHUD

extension UIViewController {
    
    // MARK: - Public methods
    
    func showAlertWith(message: AlertMessage, style: UIAlertController.Style = .alert) {
        
        let alertController = UIAlertController(title: message.title, message: message.body, preferredStyle: style)

        let action = UIAlertAction(title: "Ok", style: .default) { (_) in
            self.dismiss(animated: true, completion: nil)
        }
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    func showLoader(isLoading: Bool) {
        if isLoading {
            if !KRProgressHUD.isVisible {
                KRProgressHUD.show()
            }
        } else {
            KRProgressHUD.dismiss()
        }
    }
    
}
