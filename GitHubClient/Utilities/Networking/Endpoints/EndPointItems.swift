//
//  EndPointItems.swift
//  GitHubClient
//
//  Created by ichi on 2019/06/14.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import Alamofire

// MARK: - Enums

enum NetworkEnvironment {
    case dev
    case production
    case stage
}

enum EndPointItemsType {
    case getUsers
    case getUser(login: String)
    case getUserRepository(login: String)
}

// MARK: - Extensions
// MARK: - EndPointType

extension EndPointItemsType: EndPointType {
    
    // MARK: - Vars & Lets
    
    var baseURL: String {
        switch APIManager.networkEnviroment {
        case .dev:
            return Constants.baseURL
        case .production:
            return Constants.baseURL
        case .stage:
            return Constants.baseURL
        }
    }
    
    var version: String {
        return "/v3"
    }
    
    var path: String {
        switch self {
        case .getUsers:
            return "users"
        case .getUser(let login):
            return "users/\(login)"
        case .getUserRepository(let login):
            return "users/\(login)/repos"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        default:
            return ["Content-Type": "application/json",
                    "X-Requested-With": "XMLHttpRequest"]
        }
    }
    
    var url: URL {
        switch self {
        default:
            return URL(string: self.baseURL + self.path)!
        }
    }
    
    var encoding: ParameterEncoding {
        switch self.httpMethod {
        case .post:
            return JSONEncoding.default
        default:
            return URLEncoding.default
        }
    }
    
}
