//
//  RepositoryApiManager.swift
//  GitHubClient
//
//  Created by ichi on 2019/02/26.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit
import SwiftyJSON

class RepositoryApiManager {
    
    public static func getRepositoryList(reposUrl: String, page: Int = 0) -> Promise<JSON> {
        
        let parameters: [String: Any] = [
            "access_token": APIConstants.accessToken,
            "page": page
        ]
        
        return Promise<JSON> { seal in
            Alamofire.request(reposUrl, method: .get, parameters: parameters).validate().responseJSON { response in
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
