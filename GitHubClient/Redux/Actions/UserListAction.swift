//
//  UserListAction.swift
//  GitHubClient
//
//  Created by ichi on 2019/02/24.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import ReSwift

extension UserListState {
    
    enum UserListAction: Action {
        case loadUserList
        case loadedUserList(userList: [UserEntity], refresh: Bool)
        case failure(_ error: AlertError)
    }
    
}
