//
//  Store.swift
//  GitHubClient
//
//  Created by ichi on 2019/02/24.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//
import ReSwift

var store = Store<AppState>(
    reducer: appReducer,
    state: nil,
    middleware: [loggingMiddleware]
)
