//
//  UserDetailActionCreator.swift
//  GitHubClient
//
//  Created by ichi on 2019/02/26.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import Foundation
import ReSwift

class UserDetailActionCreator {
    
    private let userRequest: UserRequestProtocol
    private let repositoryRequest: RepositoryRequestProtocol
    
    init(userRequest: UserRequestProtocol = UserRequest(),
         repositotyRequest: RepositoryRequestProtocol = RepositoryRequest()) {
        self.userRequest = userRequest
        self.repositoryRequest = repositotyRequest
    }
    
    public func fetchUser(login: String, refresh: Bool = false) {
        
        store.dispatch(UserDetailState.UserDetailAction.load)
        
        self.userRequest.get(login: login).done { user in
            store.dispatch(UserDetailState.UserDetailAction.loadedUser(user: user))
            }.catch { (error) in
                store.dispatch(UserDetailState.UserDetailAction.failure(error as! AlertError))
        }
        
    }
    
    public func fetchRepositoryList(login: String, page: Int = 0, loadMore: Bool = false, refresh: Bool = false) {
        
        let nextPage = loadMore ? (page + 1) : ( refresh ? 1 : (page + 1) )
        
        store.dispatch(UserDetailState.UserDetailAction.load)
        
        self.repositoryRequest.getList(login: login, page: nextPage).done { (repositoryList) in
            
            let filteredRepositoryList = repositoryList.filter({ (repository) -> Bool in
                repository.fork == false
            })
            
            if loadMore {
                store.dispatch(UserDetailState.UserDetailAction.loadedRepositoryListMore(repostoryList: filteredRepositoryList))
            } else {
                store.dispatch(UserDetailState.UserDetailAction.loadedRepositoryList(repostoryList: filteredRepositoryList))
            }
            }.catch { (error) in
                store.dispatch(UserDetailState.UserDetailAction.failure(error as! AlertError))
        }
        
    }
    
}
