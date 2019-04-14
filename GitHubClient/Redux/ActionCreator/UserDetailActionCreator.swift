//
//  UserDetailActionCreator.swift
//  GitHubClient
//
//  Created by ichi on 2019/02/26.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import Foundation
import ReSwift

struct UserDetailActionCreator {
        
    public static func fetchUser(url: String, refresh: Bool = false) {
        
        store.dispatch(UserDetailState.UserDetailAction.load)
        
        UserApiManager.getUser(url: url).done { user in
            store.dispatch(UserDetailState.UserDetailAction.loadedUser(user: user))
            }.catch { (error) in
                store.dispatch(UserDetailState.UserDetailAction.failure(error: error))
        }
        
    }
    
    public static func fetchRepositoryList(reposUrl: String, page: Int = 0, loadMore: Bool = false, refresh: Bool = false) {
        
        let nextPage = loadMore ? (page + 1) : ( refresh ? 1 : (page + 1) )
        
        store.dispatch(UserDetailState.UserDetailAction.load)
        
        RepositoryApiManager.getRepositoryList(reposUrl: reposUrl, page: nextPage).done { (repositoryList) in
            
            let filteredRepositoryList = repositoryList.filter({ (repository) -> Bool in
                repository.fork == false
            })
            
            if loadMore {
                store.dispatch(UserDetailState.UserDetailAction.loadedRepositoryListMore(repostoryList: filteredRepositoryList))
            } else {
                store.dispatch(UserDetailState.UserDetailAction.loadedRepositoryList(repostoryList: filteredRepositoryList))
            }
            }.catch { (error) in
                store.dispatch(UserDetailState.UserDetailAction.failure(error: error))
        }
        
    }
    
}
