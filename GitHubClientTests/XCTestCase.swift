//
//  XCTestCase.swift
//  GitHubClientTests
//
//  Created by Ichiro Hirata on 2019/07/11.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import XCTest
import Mockingjay

extension XCTestCase {
    
    func getData(forResource: String, withExtension: String = "json") -> Data? {
        
        do {
            let url = Bundle(for: type(of: self)).url(forResource: forResource, withExtension: withExtension)!
            return try Data(contentsOf: url)
        } catch _ {
            return nil
        }
        
    }
    
    func partUri(_ uri: String) -> (_ request: URLRequest) -> Bool {
        return { (_ request: URLRequest) in
            return request.url?.absoluteString.contains(uri) ?? false
        }
    }
    
}
