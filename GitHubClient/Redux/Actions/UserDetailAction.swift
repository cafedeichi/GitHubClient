//
//  UserDetailAction.swift
//  GitHubClient
//
//  Created by ichi on 2019/02/26.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import ReSwift

extension UserDetailState {
    
    enum UserDetailAction: Action {
        case load
        case loadedUser(user: UserEntity)
        case loadedRepositoryList(repostoryList: [RepositoryEntity])
        case loadedRepositoryListMore(repostoryList: [RepositoryEntity])
        case failure(error: Error)
    }
    
}
