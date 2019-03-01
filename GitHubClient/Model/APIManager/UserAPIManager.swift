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
import SwiftyJSON

class UserApiManager {
        
    public static func getUserList(since: Int = 0) -> Promise<JSON> {
        
        let parameters: [String: Any] = [
            "access_token": APIConstants.accessToken,
            "since": since
        ]
        
        return Promise<JSON> { seal in
            Alamofire.request(APIConstants.baseUrl, method: .get, parameters: parameters).validate().responseJSON { response in
                switch response.result {
                case .success(let response):
                    let json = JSON(response)
                    seal.fulfill(json)
                case .failure(let error):
                    seal.reject(error)
                }
            }
        }
        
    }
    
    public static func getUser(url: String) -> Promise<JSON> {
        
        let parameters: [String: Any] = [
            "access_token": APIConstants.accessToken
        ]
        
        return Promise<JSON> { seal in
            Alamofire.request(url, method: .get, parameters: parameters).validate().responseJSON { response in
                    switch response.result {
                    case .success(let response):
                        let json = JSON(response)
                        seal.fulfill(json)
                    case .failure(let error):
                        seal.reject(error)
                    }
            }
        }
        
    }    
    
}
