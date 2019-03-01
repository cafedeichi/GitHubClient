//
//  Repository.swift
//  GitHubClient
//
//  Created by ichi on 2019/02/26.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import Foundation
import SwiftyJSON

class Repository {
    
    public static func getRepositoryListBy(json: JSON) -> [RepositoryEntity] {
        
        var repositoryList: [RepositoryEntity] = []
        
        for (key: _, value: value) in json {
            repositoryList.append(RepositoryEntity(value))
        }
        
        return repositoryList
        
    }
    
}
