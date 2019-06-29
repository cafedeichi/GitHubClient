//
//  AlertMessage.swift
//  GitHubClient
//
//  Created by ichi on 2019/06/14.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import Foundation

class AlertError: Error {
    
    // MARK: - Vars & Lets
    
    var title = ""
    var message = ""
    
    // MARK: - Intialization
    
    init(title: String, message: String) {
        self.title = title
        self.message = message
    }
    
}
