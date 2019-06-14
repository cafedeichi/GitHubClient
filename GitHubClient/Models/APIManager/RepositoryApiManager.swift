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

class RepositoryApiManager {
    
    public static func getRepositoryList(reposUrl: String, page: Int = 0) -> Promise<[RepositoryEntity]> {
        
        let parameters: [String: Any] = [
            "access_token": APIConstants.accessToken,
            "page": page
        ]
        
        return Promise<[RepositoryEntity]> { seal in
            Alamofire.request(reposUrl, method: .get, parameters: parameters).validate().response { response in
                guard let data = response.data else { return }
                do {
                    let decoder = JSONDecoder()
                    let repositoryList = try decoder.decode([RepositoryEntity].self, from: data)
                    seal.fulfill(repositoryList)
                } catch let error {
                    seal.reject(error)
                }
            }
        }
        
    }
    
}
