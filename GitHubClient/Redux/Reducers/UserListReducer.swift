//
//  UserListReducer.swift
//  GitHubClient
//
//  Created by ichi on 2019/02/24.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import ReSwift
import Alamofire

struct UserListReducer {
    
    public static func reducer(action: Action, state: UserListState?) -> UserListState {
        
        var state = state ?? UserListState()
        
        guard let action = action as? UserListState.UserListAction else {
            return state
        }
        
        switch action {
        case .loadUserList:
            state.isLoading = true
        case let .loadedUserList(userList, refresh):
            state.isLoading = false
            if refresh {
                state.userList = userList
            } else {
                if state.since != userList.last!.id {
                    state.since = userList.last!.id
                    state.userList += userList
                }
            }
            state.error = nil
        case let .failure(message):
            state.isLoading = false
            state.error = message
        }
        
        return state
    }
}
