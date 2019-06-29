//
//  UserListState.swift
//  GitHubClient
//
//  Created by ichi on 2019/02/23.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import ReSwift

struct UserListState: StateType {
    var isLoading: Bool = false
    var since: Int = 0
    var userList: [UserEntity] = []
    var error: AlertError?
}
