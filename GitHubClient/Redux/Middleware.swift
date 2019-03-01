//
//  Middleware.swift
//  GitHubClient
//
//  Created by ichi on 2019/03/01.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//
import ReSwift

let loggingMiddleware: Middleware<Any> = { dispatch, getState in
    return { next in
        return { action in
            Logger.debugPrint("\(action)")
            next(action)
        }
    }
}
