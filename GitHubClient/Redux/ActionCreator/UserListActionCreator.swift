//
//  UserListActionCreator.swift
//  GitHubClient
//
//  Created by ichi on 2019/02/24.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import Foundation
import ReSwift

struct UserListActionCreator {
    
    public static func fetchUserList(since: Int = 0, refresh: Bool = false) {
        
        let lastUserId = (refresh) ? 0 : since
        
        store.dispatch(UserListState.UserListAction.loadUserList())
        
        UserApiManager.getUserList(since: lastUserId).done { (json) in
            let userList = User.getUserListBy(json: json)
            store.dispatch(UserListState.UserListAction.loadedUserList(userList: userList, refresh: refresh))
        }.catch { (error) in
            store.dispatch(UserListState.UserListAction.failure(error: error))
        }
        
    }

}
