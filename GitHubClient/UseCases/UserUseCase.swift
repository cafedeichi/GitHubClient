//
//  UserUseCase.swift
//  GitHubClient
//
//  Created by ichi on 2019/02/24.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

class UserUseCase {
        
    public static func getList(since: Int = 0) -> Promise<[UserEntity]> {
        
        let parameters: [String: Any] = [
            "access_token": Constants.accessToken,
            "since": since
        ]
        
        return Promise<[UserEntity]> { seal in
            APIManager.shared().call(type: EndPointItemsType.getUsers,
                                     parameters: parameters) { (response: Swift.Result<[UserEntity], AlertMessage>) in
                switch response {
                case .success(let userList):
                    seal.fulfill(userList)
                case .failure(let alertMessage):
                    seal.reject(alertMessage)
                }
            }
        }
        
    }
    
    public static func get(login: String) -> Promise<UserEntity> {
        
        let parameters: [String: Any] = [
            "access_token": Constants.accessToken
        ]
        
        return Promise<UserEntity> { seal in
            APIManager.shared().call(type: EndPointItemsType.getUser(login: login),
                                     parameters: parameters) { (response: Swift.Result<UserEntity, AlertMessage>) in
                switch response {
                case .success(let user):
                    seal.fulfill(user)
                case .failure(let alertMessage):
                    seal.reject(alertMessage)
                }
            }
        }
        
    }    
    
}
