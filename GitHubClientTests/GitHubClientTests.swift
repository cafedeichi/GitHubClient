//
//  GitHubClientTests.swift
//  GitHubClientTests
//
//  Created by Ichiro Hirata on 2019/07/08.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import XCTest
import Mockingjay
@testable import GitHubClient

class GitHubClientTests: XCTestCase {
    
    private let userRequest = UserRequest()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        
        let users = getData(forResource: "users")!
        let user = getData(forResource: "user")!
        let notFoundStub = http(404, headers: nil, download: nil)
        let serverErrorStub = http(500, headers: nil, download: nil)
        
        stub(partUri("/users?since=0"), jsonData(users))
        stub(partUri("/users?since=1"), notFoundStub)
        stub(partUri("/users?since=2"), serverErrorStub)
        stub(partUri("/users/mojombo"), jsonData(user))
        stub(partUri("/users/anonymous"), notFoundStub)
        stub(partUri("/users/retriever"), serverErrorStub)

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetListSuccess() {

        let exp = expectation(description: "wait for the complete api")
        
        self.userRequest.getList(since: 0).done { userList in
            XCTAssertEqual(userList.count, 30)
            XCTAssertEqual(userList.first!.id, 1)
            XCTAssertEqual(userList.first!.login, "mojombo")
            XCTAssertNil(userList.first!.name)
            XCTAssertEqual(userList.last!.id, 46)
            XCTAssertEqual(userList.last!.login, "bmizerany")
            XCTAssertNil(userList.last!.name)
            exp.fulfill()
        }.catch { error in
            XCTFail("Unexpected error ocurred : \((error as! AlertError).message)")
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
        
    }

    func testGetListFailure() {
        
        let exp = expectation(description: "wait for the complete api")
        
        self.userRequest.getList(since: 1).done { _ in
            XCTFail("Data should not be retrieved. ")
            exp.fulfill()
        }.catch { error in
            Logger.debugPrint((error as! AlertError).message)
            XCTAssertNotNil(error)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
        
    }

    func testGetListServerError() {
        
        let exp = expectation(description: "wait for the complete api")
        
        self.userRequest.getList(since: 2).done { _ in
            XCTFail("Data should not be retrieved. ")
            exp.fulfill()
        }.catch { error in
            Logger.debugPrint((error as! AlertError).message)
            XCTAssertNotNil(error)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
        
    }
    
    func testGetSuccess() {
        
        let exp = expectation(description: "wait for the complete api")
        
        self.userRequest.get(login: "mojombo").done { (user) in
            XCTAssertEqual(user.id, 1)
            XCTAssertEqual(user.login, "mojombo")
            XCTAssertNotNil(user.name)
            exp.fulfill()
        }.catch { error in
            XCTFail("Unexpected error ocurred : \((error as! AlertError).message)")
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
        
    }
    
    func testGetFailure() {
        
        let exp = expectation(description: "wait for the complete api")
        
        self.userRequest.get(login: "anonymous").done { _ in
            XCTFail("Data should not be retrieved. ")
            exp.fulfill()
        }.catch { error in
            Logger.debugPrint((error as! AlertError).message)
            XCTAssertNotNil(error)
            exp.fulfill()
        }

        wait(for: [exp], timeout: 10)
        
    }

    func testGetServerError() {
        
        let exp = expectation(description: "wait for the complete api")
        
        self.userRequest.get(login: "retriever").done { _ in
            XCTFail("Data should not be retrieved. ")
            exp.fulfill()
        }.catch { error in
            Logger.debugPrint((error as! AlertError).message)
            XCTAssertNotNil(error)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)

    }

}
