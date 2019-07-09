// MARK: - Mocks generated from file: GitHubClient/Models/Requests/RepositoryRequest.swift at 2019-07-09 02:31:19 +0000

//
//  RepositoryRequest.swift
//  GitHubClient
//
//  Created by ichi on 2019/02/26.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import Cuckoo
@testable import GitHubClient

import Foundation
import PromiseKit


 class MockRepositoryRequestProtocol: RepositoryRequestProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = RepositoryRequestProtocol
    
     typealias Stubbing = __StubbingProxy_RepositoryRequestProtocol
     typealias Verification = __VerificationProxy_RepositoryRequestProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: RepositoryRequestProtocol?

     func enableDefaultImplementation(_ stub: RepositoryRequestProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func getList(login: String, page: Int) -> Promise<[RepositoryEntity]> {
        
    return cuckoo_manager.call("getList(login: String, page: Int) -> Promise<[RepositoryEntity]>",
            parameters: (login, page),
            escapingParameters: (login, page),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getList(login: login, page: page))
        
    }
    

	 struct __StubbingProxy_RepositoryRequestProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getList<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(login: M1, page: M2) -> Cuckoo.ProtocolStubFunction<(String, Int), Promise<[RepositoryEntity]>> where M1.MatchedType == String, M2.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(String, Int)>] = [wrap(matchable: login) { $0.0 }, wrap(matchable: page) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockRepositoryRequestProtocol.self, method: "getList(login: String, page: Int) -> Promise<[RepositoryEntity]>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_RepositoryRequestProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getList<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(login: M1, page: M2) -> Cuckoo.__DoNotUse<(String, Int), Promise<[RepositoryEntity]>> where M1.MatchedType == String, M2.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(String, Int)>] = [wrap(matchable: login) { $0.0 }, wrap(matchable: page) { $0.1 }]
	        return cuckoo_manager.verify("getList(login: String, page: Int) -> Promise<[RepositoryEntity]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class RepositoryRequestProtocolStub: RepositoryRequestProtocol {
    

    

    
     func getList(login: String, page: Int) -> Promise<[RepositoryEntity]>  {
        return DefaultValueRegistry.defaultValue(for: (Promise<[RepositoryEntity]>).self)
    }
    
}



 class MockRepositoryRequest: RepositoryRequest, Cuckoo.ClassMock {
    
     typealias MocksType = RepositoryRequest
    
     typealias Stubbing = __StubbingProxy_RepositoryRequest
     typealias Verification = __VerificationProxy_RepositoryRequest

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: RepositoryRequest?

     func enableDefaultImplementation(_ stub: RepositoryRequest) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    public override func getList(login: String, page: Int) -> Promise<[RepositoryEntity]> {
        
    return cuckoo_manager.call("getList(login: String, page: Int) -> Promise<[RepositoryEntity]>",
            parameters: (login, page),
            escapingParameters: (login, page),
            superclassCall:
                
                super.getList(login: login, page: page)
                ,
            defaultCall: __defaultImplStub!.getList(login: login, page: page))
        
    }
    

	 struct __StubbingProxy_RepositoryRequest: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getList<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(login: M1, page: M2) -> Cuckoo.ClassStubFunction<(String, Int), Promise<[RepositoryEntity]>> where M1.MatchedType == String, M2.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(String, Int)>] = [wrap(matchable: login) { $0.0 }, wrap(matchable: page) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockRepositoryRequest.self, method: "getList(login: String, page: Int) -> Promise<[RepositoryEntity]>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_RepositoryRequest: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getList<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(login: M1, page: M2) -> Cuckoo.__DoNotUse<(String, Int), Promise<[RepositoryEntity]>> where M1.MatchedType == String, M2.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(String, Int)>] = [wrap(matchable: login) { $0.0 }, wrap(matchable: page) { $0.1 }]
	        return cuckoo_manager.verify("getList(login: String, page: Int) -> Promise<[RepositoryEntity]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class RepositoryRequestStub: RepositoryRequest {
    

    

    
    public override func getList(login: String, page: Int) -> Promise<[RepositoryEntity]>  {
        return DefaultValueRegistry.defaultValue(for: (Promise<[RepositoryEntity]>).self)
    }
    
}


// MARK: - Mocks generated from file: GitHubClient/Models/Requests/UserRequest.swift at 2019-07-09 02:31:19 +0000

//
//  UserRequest.swift
//  GitHubClient
//
//  Created by ichi on 2019/02/24.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import Cuckoo
@testable import GitHubClient

import Foundation
import PromiseKit


 class MockUserRequestProtocol: UserRequestProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = UserRequestProtocol
    
     typealias Stubbing = __StubbingProxy_UserRequestProtocol
     typealias Verification = __VerificationProxy_UserRequestProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: UserRequestProtocol?

     func enableDefaultImplementation(_ stub: UserRequestProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func getList(since: Int) -> Promise<[UserEntity]> {
        
    return cuckoo_manager.call("getList(since: Int) -> Promise<[UserEntity]>",
            parameters: (since),
            escapingParameters: (since),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getList(since: since))
        
    }
    
    
    
     func get(login: String) -> Promise<UserEntity> {
        
    return cuckoo_manager.call("get(login: String) -> Promise<UserEntity>",
            parameters: (login),
            escapingParameters: (login),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.get(login: login))
        
    }
    

	 struct __StubbingProxy_UserRequestProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getList<M1: Cuckoo.Matchable>(since: M1) -> Cuckoo.ProtocolStubFunction<(Int), Promise<[UserEntity]>> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: since) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockUserRequestProtocol.self, method: "getList(since: Int) -> Promise<[UserEntity]>", parameterMatchers: matchers))
	    }
	    
	    func get<M1: Cuckoo.Matchable>(login: M1) -> Cuckoo.ProtocolStubFunction<(String), Promise<UserEntity>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: login) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockUserRequestProtocol.self, method: "get(login: String) -> Promise<UserEntity>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_UserRequestProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getList<M1: Cuckoo.Matchable>(since: M1) -> Cuckoo.__DoNotUse<(Int), Promise<[UserEntity]>> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: since) { $0 }]
	        return cuckoo_manager.verify("getList(since: Int) -> Promise<[UserEntity]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func get<M1: Cuckoo.Matchable>(login: M1) -> Cuckoo.__DoNotUse<(String), Promise<UserEntity>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: login) { $0 }]
	        return cuckoo_manager.verify("get(login: String) -> Promise<UserEntity>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class UserRequestProtocolStub: UserRequestProtocol {
    

    

    
     func getList(since: Int) -> Promise<[UserEntity]>  {
        return DefaultValueRegistry.defaultValue(for: (Promise<[UserEntity]>).self)
    }
    
     func get(login: String) -> Promise<UserEntity>  {
        return DefaultValueRegistry.defaultValue(for: (Promise<UserEntity>).self)
    }
    
}



 class MockUserRequest: UserRequest, Cuckoo.ClassMock {
    
     typealias MocksType = UserRequest
    
     typealias Stubbing = __StubbingProxy_UserRequest
     typealias Verification = __VerificationProxy_UserRequest

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: UserRequest?

     func enableDefaultImplementation(_ stub: UserRequest) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    public override func getList(since: Int) -> Promise<[UserEntity]> {
        
    return cuckoo_manager.call("getList(since: Int) -> Promise<[UserEntity]>",
            parameters: (since),
            escapingParameters: (since),
            superclassCall:
                
                super.getList(since: since)
                ,
            defaultCall: __defaultImplStub!.getList(since: since))
        
    }
    
    
    
    public override func get(login: String) -> Promise<UserEntity> {
        
    return cuckoo_manager.call("get(login: String) -> Promise<UserEntity>",
            parameters: (login),
            escapingParameters: (login),
            superclassCall:
                
                super.get(login: login)
                ,
            defaultCall: __defaultImplStub!.get(login: login))
        
    }
    

	 struct __StubbingProxy_UserRequest: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getList<M1: Cuckoo.Matchable>(since: M1) -> Cuckoo.ClassStubFunction<(Int), Promise<[UserEntity]>> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: since) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockUserRequest.self, method: "getList(since: Int) -> Promise<[UserEntity]>", parameterMatchers: matchers))
	    }
	    
	    func get<M1: Cuckoo.Matchable>(login: M1) -> Cuckoo.ClassStubFunction<(String), Promise<UserEntity>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: login) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockUserRequest.self, method: "get(login: String) -> Promise<UserEntity>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_UserRequest: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getList<M1: Cuckoo.Matchable>(since: M1) -> Cuckoo.__DoNotUse<(Int), Promise<[UserEntity]>> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: since) { $0 }]
	        return cuckoo_manager.verify("getList(since: Int) -> Promise<[UserEntity]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func get<M1: Cuckoo.Matchable>(login: M1) -> Cuckoo.__DoNotUse<(String), Promise<UserEntity>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: login) { $0 }]
	        return cuckoo_manager.verify("get(login: String) -> Promise<UserEntity>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class UserRequestStub: UserRequest {
    

    

    
    public override func getList(since: Int) -> Promise<[UserEntity]>  {
        return DefaultValueRegistry.defaultValue(for: (Promise<[UserEntity]>).self)
    }
    
    public override func get(login: String) -> Promise<UserEntity>  {
        return DefaultValueRegistry.defaultValue(for: (Promise<UserEntity>).self)
    }
    
}

