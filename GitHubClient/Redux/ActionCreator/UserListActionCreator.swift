//
//  UserListActionCreator.swift
//  GitHubClient
//
//  Created by ichi on 2019/02/24.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import Foundation
import ReSwift

class UserListActionCreator {
    
    private let userRequest: UserRequestProtocol
    
    init(userRequest: UserRequestProtocol = UserRequest()) {
        self.userRequest = userRequest
    }
    
    public func fetchUserList(since: Int = 0, refresh: Bool = false) {
        
        let lastUserId = (refresh) ? 0 : since
        
        store.dispatch(UserListState.UserListAction.loadUserList)
                
        self.userRequest.getList(since: lastUserId).done { userList in
            store.dispatch(UserListState.UserListAction.loadedUserList(userList: userList, refresh: refresh))
            }.catch { error in
                store.dispatch(UserListState.UserListAction.failure(error as! AlertError))
        }
        
    }

}
