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
    
    func showAlertWith(error: AlertError?, style: UIAlertController.Style = .alert, completion: (() -> Void)? = nil) {
        
        if error == nil {
            return
        }
        
        let alertController = UIAlertController(title: error!.title, message: error!.message, preferredStyle: style)

        let action = UIAlertAction(title: "OK", style: .default) { (_) in
            alertController.dismiss(animated: true) {
                completion?()
            }
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
