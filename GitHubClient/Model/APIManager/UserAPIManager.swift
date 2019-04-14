//
//  UserApiManager.swift
//  GitHubClient
//
//  Created by ichi on 2019/02/24.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

class UserApiManager {
        
    public static func getUserList(since: Int = 0) -> Promise<[UserEntity]> {
        
        let parameters: [String: Any] = [
            "access_token": APIConstants.accessToken,
            "since": since
        ]
        
        return Promise<[UserEntity]> { seal in
            Alamofire.request(APIConstants.baseUrl, method: .get, parameters: parameters).validate().response { response in
                guard let data = response.data else { return }
                do {
                    let decoder = JSONDecoder()
                    let userList = try decoder.decode([UserEntity].self, from: data)
                    seal.fulfill(userList)
                } catch let error {
                    seal.reject(error)
                }
            }
        }
        
    }
    
    public static func getUser(url: String) -> Promise<UserEntity> {
        
        let parameters: [String: Any] = [
            "access_token": APIConstants.accessToken
        ]
        
        return Promise<UserEntity> { seal in
            Alamofire.request(url, method: .get, parameters: parameters).validate().response { response in
                guard let data = response.data else { return }
                do {
                    let decoder = JSONDecoder()
                    let user = try decoder.decode(UserEntity.self, from: data)
                    seal.fulfill(user)
                } catch let error {
                    seal.reject(error)
                }
            }
        }
        
    }    
    
}
