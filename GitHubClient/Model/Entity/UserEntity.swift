//
//  UserEntiry.swift
//  GitHubClient
//
//  Created by ichi on 2019/02/24.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import Foundation
import SwiftyJSON

struct UserEntity {
    
    let login: String
    let id: Int
    let nodeId: String?
    let avatarUrl: String?
    let gravatarId: String?
    let url: String?
    let htmlUrl: String?
    let followersUrl: String?
    let followingUrl: String?
    let gistsUrl: String?
    let starredUrl: String?
    let subscriptionsUrl: String?
    let organizationsUrl: String?
    let reposUrl: String?
    let eventsUrl: String?
    let receivedEventsUrl: String?
    let type: String?
    let siteAdmin: Bool?
    let name: String?
    let company: String?
    let blog: String?
    let location: String?
    let email: String?
    let hireable: String?
    let bio: String?
    let publicRepos: Int?
    let publicGists: Int?
    let followers: Int?
    let following: Int?
    let createdAt: String?
    let updatedAt: String?
    
    init(_ json: JSON) {
        login = json["login"].stringValue
        id = json["id"].intValue
        nodeId = json["node_id"].stringValue
        avatarUrl = json["avatar_url"].stringValue
        gravatarId = json["gravatar_id"].stringValue
        url = json["url"].stringValue
        htmlUrl = json["html_url"].stringValue
        followersUrl = json["followers_url"].stringValue
        followingUrl = json["following_url"].stringValue
        gistsUrl = json["gists_url"].stringValue
        starredUrl = json["starred_url"].stringValue
        subscriptionsUrl = json["subscriptions_url"].stringValue
        organizationsUrl = json["organizations_url"].stringValue
        reposUrl = json["repos_url"].stringValue
        eventsUrl = json["events_url"].stringValue
        receivedEventsUrl = json["received_events_url"].stringValue
        type = json["type"].stringValue
        siteAdmin = json["site_admin"].boolValue
        name = json["name"].stringValue
        company = json["company"].stringValue
        blog = json["blog"].stringValue
        location = json["location"].stringValue
        email = json["email"].stringValue
        hireable = json["hireable"].stringValue
        bio = json["bio"].stringValue
        publicRepos = json["public_repos"].intValue
        publicGists = json["public_gists"].intValue
        followers = json["followers"].intValue
        following = json["following"].intValue
        createdAt = json["created_at"].stringValue
        updatedAt = json["updated_at"].stringValue
    }
    
}
