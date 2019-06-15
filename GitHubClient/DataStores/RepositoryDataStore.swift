//
//  RepositoryDataStore.swift
//  GitHubClient
//
//  Created by ichi on 2019/02/26.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import Foundation
import PromiseKit

class RepositoryDataStore {
    
    public static func getList(login: String, page: Int = 0) -> Promise<[RepositoryEntity]> {
        
        let parameters: [String: Any] = [
            "page": page
        ]
        
        return Promise<[RepositoryEntity]> { seal in
            APIManager.shared().call(type: EndPointItemsType.getUserRepository(login: login),
                                     parameters: parameters) { (response: Swift.Result<[RepositoryEntity], AlertMessage>) in
                                        switch response {
                                        case .success(let repositoryList):
                                            seal.fulfill(repositoryList)
                                        case .failure(let alertMessage):
                                            seal.reject(alertMessage)
                                        }
            }
        }
        
    }
    
}
