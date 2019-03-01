//
//  AppReducer.swift
//  GitHubClient
//
//  Created by ichi on 2019/02/23.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import ReSwift

func appReducer(action: Action, state: AppState?) -> AppState {
    var state = state ?? AppState()
    state.userList = UserListReducer.reducer(action: action, state: state.userList)
    state.userDetail = UserDetailReducer.reducer(action: action, state: state.userDetail)
    return state
}
