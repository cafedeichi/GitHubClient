//
//  NetworkError.swift
//  GitHubClient
//
//  Created by ichi on 2019/06/14.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import Foundation

class NetworkError: Codable {
    
    let message: String
    let key: String?
    
}
