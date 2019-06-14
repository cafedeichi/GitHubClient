//
//  LicenseEntity.swift
//  GitHubClient
//
//  Created by ichi on 2019/04/14.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import Foundation

class LicenseEntity: Codable {
    
    let key: String?
    let name: String?
    let spdxId: String?
    let url: String?
    let nodeId: String?
    
    private enum CodingKeys: String, CodingKey {
        case key
        case name
        case spdxId = "spdx_id"
        case url
        case nodeId = "node_id"
    }
    
}
