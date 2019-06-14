//
//  APIManagerAdapter.swift
//  GitHubClient
//
//  Created by ichi on 2019/06/14.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import Alamofire

final class APIManagerAdapter: RequestAdapter {
    private let accessToken: String
    
    init(accessToken: String) {
        self.accessToken = accessToken
    }
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        if let urlString = urlRequest.url?.absoluteString, urlString.hasPrefix(Constants.baseURL) {
            /// Set the Authorization header value using the access token.
            urlRequest.setValue("token " + accessToken, forHTTPHeaderField: "Authorization")
        }        
        return urlRequest
    }
}
