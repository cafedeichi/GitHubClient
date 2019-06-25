//
//  APIManagerAdapter.swift
//  GitHubClient
//
//  Created by ichi on 2019/06/14.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import Alamofire

final class APIManagerAdapter: RequestAdapter {    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        // Print all outgoing requests.
        Logger.debugPrint("Running request: \(urlRequest.httpMethod ?? "") - \(urlRequest.url?.absoluteString ?? "")")
        return urlRequest
    }
}
