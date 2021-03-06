//
//  ApiManager.swift
//  GitHubClient
//
//  Created by ichi on 2019/06/14.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import Alamofire

class APIManager {
    
    // MARK: - Vars & Lets
    
    private let sessionManager: SessionManager
    private let retrier: APIManagerRetrier
    
    #if DEVELOP
    static let networkEnviroment: NetworkEnvironment = .dev
    #elseif STAGING
    static let networkEnviroment: NetworkEnvironment = .stage
    #else
    static let networkEnviroment: NetworkEnvironment = .production
    #endif
    
    private static var sharedApiManager: APIManager = {
        let apiManager = APIManager(sessionManager: SessionManager(), retrier: APIManagerRetrier())
        return apiManager
    }()
    
    // MARK: - Initialization
    
    private init(sessionManager: SessionManager, retrier: APIManagerRetrier) {
        sessionManager.adapter = APIManagerAdapter()
        self.sessionManager = sessionManager
        self.retrier = retrier
        self.sessionManager.retrier = self.retrier
    }
    
    // MARK: - Accessors
    
    class func shared() -> APIManager {
        return sharedApiManager
    }
    
    // MARK: - Public methods
    
    func call(type: EndPointType, parameters: Parameters? = nil, handler: @escaping (Swift.Result<(), AlertError>) -> Void) {
        self.sessionManager.request(type.url,
                                    method: type.httpMethod,
                                    parameters: parameters,
                                    encoding: type.encoding,
                                    headers: type.headers).validate().responseJSON { (data) in
                                        switch data.result {
                                        case .success:
                                            handler(.success(()))
                                        case .failure:
                                            handler(.failure(self.parseApiError(data: data.data)))
                                        }
        }
    }
    
    func call<T>(type: EndPointType, parameters: Parameters? = nil, handler: @escaping (Swift.Result<T, AlertError>) -> Void) where T: Codable {
        self.sessionManager.request(type.url,
                                    method: type.httpMethod,
                                    parameters: parameters,
                                    encoding: type.encoding,
                                    headers: type.headers).validate().responseJSON { (data) in
                                        do {
                                            guard let jsonData = data.data else {
                                                throw AlertError(title: "Error", message: "No data")
                                            }
                                            let result = try JSONDecoder().decode(T.self, from: jsonData)
                                            handler(.success(result))
                                            self.resetNumberOfRetries()
                                        } catch {
                                            if let error = error as? AlertError {
                                                return handler(.failure(error))
                                            }
                                            handler(.failure(self.parseApiError(data: data.data)))
                                        }
        }
    }
    
    // MARK: - Private methods
    
    private func resetNumberOfRetries() {
        self.retrier.numberOfRetries = 0
    }
    
    private func parseApiError(data: Data?) -> AlertError {
        let decoder = JSONDecoder()
        if let jsonData = data, let error = try? decoder.decode(NetworkError.self, from: jsonData) {
            return AlertError(title: L10n.errorAlertTitle, message: error.key ?? error.message)
        }
        return AlertError(title: L10n.errorAlertTitle, message: L10n.genericErrorMessage)
    }

}
