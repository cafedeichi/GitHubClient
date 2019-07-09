//
//  UserRequest.swift
//  GitHubClient
//
//  Created by ichi on 2019/02/24.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import Foundation
import PromiseKit

protocol UserRequestProtocol {
    func getList(since: Int) -> Promise<[UserEntity]>
    func get(login: String) -> Promise<UserEntity>
}

class UserRequest: UserRequestProtocol {
        
    public func getList(since: Int = 0) -> Promise<[UserEntity]> {
        
        let parameters: [String: Any] = [
            "since": since
        ]
        
        return Promise<[UserEntity]> { seal in
            APIManager.shared().call(type: EndPointItemsType.getUsers,
                                     parameters: parameters) { (response: Swift.Result<[UserEntity], AlertError>) in
                switch response {
                case .success(let userList):
                    seal.fulfill(userList)
                case .failure(let error):
                    seal.reject(error)
                }
            }
        }
        
    }
    
    public func get(login: String) -> Promise<UserEntity> {
        
        return Promise<UserEntity> { seal in
            APIManager.shared().call(type: EndPointItemsType.getUser(login: login)) { (response: Swift.Result<UserEntity, AlertError>) in
                switch response {
                case .success(let user):
                    seal.fulfill(user)
                case .failure(let error):
                    seal.reject(error)
                }
            }
        }
        
    }    
    
}
