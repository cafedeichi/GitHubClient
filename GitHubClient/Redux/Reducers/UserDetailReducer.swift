//
//  UserDetailReducer.swift
//  GitHubClient
//
//  Created by ichi on 2019/02/24.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import ReSwift
import Alamofire

struct UserDetailReducer {
    
    public static func reducer(action: Action, state: UserDetailState?) -> UserDetailState {
        
        var state = state ?? UserDetailState()
        
        guard let action = action as? UserDetailState.UserDetailAction else {
            return state
        }
        
        switch action {
        case .load:
            state.isLoading = true
        case let .loadedUser(user):
            state.isLoading = false
            state.user = user
            state.error = nil
        case let .loadedRepositoryList(repositoryList):
            state.isLoading = false
            state.page = 1
            state.repositoryList = repositoryList
            state.error = nil
        case let .loadedRepositoryListMore(repositoryList):
            state.isLoading = false
            state.page += 1
            state.repositoryList += repositoryList
            state.error = nil
        case let .failure(message):
            state.isLoading = false
            state.error = message
        }
        
        return state
    }
}
