//
//  RepositoryEntity.swift
//  GitHubClient
//
//  Created by ichi on 2019/02/26.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import Foundation
import SwiftyJSON

struct RepositoryEntity {
    
    let id: Int?
    let nodeId: String?
    let name: String?
    let fullName: String?
    let privateField: Bool?
    let owner: UserEntity?
    let htmlUrl: String?
    let description: String?
    let fork: Bool?
    let url: String?
    let forksUrl: String?
    let keysUrl: String?
    let collaboratorsUrl: String?
    let teamsUrl: String?
    let hooksUrl: String?
    let issueEventsUrl: String?
    let eventsUrl: String?
    let assigneesUrl: String?
    let branchesUrl: String?
    let tagsUrl: String?
    let blobsUrl: String?
    let gitTagsUrl: String?
    let gitRefsUrl: String?
    let treesUrl: String?
    let statusesUrl: String?
    let languagesUrl: String?
    let stargazersUrl: String?
    let contributorsUrl: String?
    let subscribersUrl: String?
    let subscriptionUrl: String?
    let commitsUrl: String?
    let gitCommitsUrl: String?
    let commentsUrl: String?
    let issueCommentUrl: String?
    let contentsUrl: String?
    let compareUrl: String?
    let mergesUrl: String?
    let archiveUrl: String?
    let downloadsUrl: String?
    let issuesUrl: String?
    let pullsUrl: String?
    let milestonesUrl: String?
    let notificationsUrl: String?
    let labelsUrl: String?
    let releasesUrl: String?
    let deploymentsUrl: String?
    let createdAt: String?
    let updatedAt: String?
    let pushedAt: String?
    let gitUrl: String?
    let sshUrl: String?
    let cloneUrl: String?
    let svnUrl: String?
    let homepage: String?
    let size: Int?
    let stargazersCount: Int?
    let watchersCount: Int?
    let language: String?
    let hasIssues: Bool?
    let hasProjects: Bool?
    let hasDownloads: Bool?
    let hasWiki: Bool?
    let hasPages: Bool?
    let forksCount: Int?
    let mirrorUrl: Any?
    let archived: Bool?
    let openIssuesCount: Int?
    let license: Any?
    let forks: Int?
    let openIssues: Int?
    let watchers: Int?
    let defaultBranch: String?
    
    init(_ json: JSON) {    // swiftlint:disable:this function_body_length
        id = json["id"].intValue
        nodeId = json["node_id"].stringValue
        name = json["name"].stringValue
        fullName = json["full_name"].stringValue
        privateField = json["private"].boolValue
        owner = UserEntity(json["owner"])
        htmlUrl = json["html_url"].stringValue
        description = json["description"].stringValue
        fork = json["fork"].boolValue
        url = json["url"].stringValue
        forksUrl = json["forks_url"].stringValue
        keysUrl = json["keys_url"].stringValue
        collaboratorsUrl = json["collaborators_url"].stringValue
        teamsUrl = json["teams_url"].stringValue
        hooksUrl = json["hooks_url"].stringValue
        issueEventsUrl = json["issue_events_url"].stringValue
        eventsUrl = json["events_url"].stringValue
        assigneesUrl = json["assignees_url"].stringValue
        branchesUrl = json["branches_url"].stringValue
        tagsUrl = json["tags_url"].stringValue
        blobsUrl = json["blobs_url"].stringValue
        gitTagsUrl = json["git_tags_url"].stringValue
        gitRefsUrl = json["git_refs_url"].stringValue
        treesUrl = json["trees_url"].stringValue
        statusesUrl = json["statuses_url"].stringValue
        languagesUrl = json["languages_url"].stringValue
        stargazersUrl = json["stargazers_url"].stringValue
        contributorsUrl = json["contributors_url"].stringValue
        subscribersUrl = json["subscribers_url"].stringValue
        subscriptionUrl = json["subscription_url"].stringValue
        commitsUrl = json["commits_url"].stringValue
        gitCommitsUrl = json["git_commits_url"].stringValue
        commentsUrl = json["comments_url"].stringValue
        issueCommentUrl = json["issue_comment_url"].stringValue
        contentsUrl = json["contents_url"].stringValue
        compareUrl = json["compare_url"].stringValue
        mergesUrl = json["merges_url"].stringValue
        archiveUrl = json["archive_url"].stringValue
        downloadsUrl = json["downloads_url"].stringValue
        issuesUrl = json["issues_url"].stringValue
        pullsUrl = json["pulls_url"].stringValue
        milestonesUrl = json["milestones_url"].stringValue
        notificationsUrl = json["notifications_url"].stringValue
        labelsUrl = json["labels_url"].stringValue
        releasesUrl = json["releases_url"].stringValue
        deploymentsUrl = json["deployments_url"].stringValue
        createdAt = json["created_at"].stringValue
        updatedAt = json["updated_at"].stringValue
        pushedAt = json["pushed_at"].stringValue
        gitUrl = json["git_url"].stringValue
        sshUrl = json["ssh_url"].stringValue
        cloneUrl = json["clone_url"].stringValue
        svnUrl = json["svn_url"].stringValue
        homepage = json["homepage"].stringValue
        size = json["size"].intValue
        stargazersCount = json["stargazers_count"].intValue
        watchersCount = json["watchers_count"].intValue
        language = json["language"].stringValue
        hasIssues = json["has_issues"].boolValue
        hasProjects = json["has_projects"].boolValue
        hasDownloads = json["has_downloads"].boolValue
        hasWiki = json["has_wiki"].boolValue
        hasPages = json["has_pages"].boolValue
        forksCount = json["forks_count"].intValue
        mirrorUrl = json["mirror_url"]
        archived = json["archived"].boolValue
        openIssuesCount = json["open_issues_count"].intValue
        license = json["license"]
        forks = json["forks"].intValue
        openIssues = json["open_issues"].intValue
        watchers = json["watchers"].intValue
        defaultBranch = json["default_branch"].stringValue
    }
    
}
