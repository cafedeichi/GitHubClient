//
//  UITableViewExtension.swift
//  GitHubClient
//
//  Created by ichi on 2019/02/24.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import UIKit

extension UITableView {

    func registerCustomCell<T: UITableViewCell>(_ cellType: T.Type) {
        self.register(UINib(nibName: T.className, bundle: nil), forCellReuseIdentifier: T.className)
    }
    
    func dequeueReusableCustomCell<T: UITableViewCell>(with cellType: T.Type) -> T {
        return self.dequeueReusableCell(withIdentifier: T.className) as! T
    }
    
}
