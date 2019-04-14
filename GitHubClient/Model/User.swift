//
//  User.swift
//  GitHubClient
//
//  Created by ichi on 2019/02/24.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import Foundation
import SwiftyJSON

class User {
    
    public static func getUserListBy(json: JSON) -> [UserEntity] {
        
        var userList: [UserEntity] = []
        
        for (key: _, value: value) in json {
            userList.append(UserEntity(from: value))
        }
        
        return userList
        
    }
    
}
