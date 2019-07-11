//
//  ApiManagerRetrier.swift
//  GitHubClient
//
//  Created by ichi on 2019/06/14.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import Foundation
import Alamofire

class APIManagerRetrier: RequestRetrier {
    
    // MARK: - Vars & Lets
    var numberOfRetries = 0

    private let lock = NSLock()
    
    // MARK: - Request Retrier methods
    
    func should(_ manager: SessionManager, retry request: Request, with error: Error, completion: @escaping RequestRetryCompletion) {
        
        self.lock.lock() ; defer { self.lock.unlock() }
        
        guard let response = request.task?.response as? HTTPURLResponse else {
            completion(false, 0.0) // don't retry
            return
        }
        
        if response.statusCode == 401 { // Unauthorized
            self.getRefreshToken { (finished) in
                completion(finished, 0.0) // retry when getting a new access token
            }
        } else if response.statusCode >= 500 && numberOfRetries < 3 { // Server Error
            self.numberOfRetries += 1
            completion(true, 1.0) // retry after 1 second
        } else {
            completion(false, 0.0) // don't retry
        }
    }
    
    private func getRefreshToken (complition: ((Bool) -> Void)) {
        // TODO: call API to get a new access token.
        complition(false)
    }
    
}
