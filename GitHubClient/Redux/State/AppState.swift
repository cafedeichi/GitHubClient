//
//  AppState.swift
//  GitHubClient
//
//  Created by ichi on 2019/02/23.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import ReSwift

struct AppState: StateType {
    var userList = UserListState()
    var userDetail = UserDetailState()
}
