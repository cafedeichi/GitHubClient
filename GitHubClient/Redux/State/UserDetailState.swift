//
//  UserDetailState.swift
//  GitHubClient
//
//  Created by ichi on 2019/02/26.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import ReSwift

struct UserDetailState: StateType {
    var isLoading: Bool = false
    var user: UserEntity?
    var page: Int = 0
    var repositoryList: [RepositoryEntity] = []
    var errorMessage: String?
}
