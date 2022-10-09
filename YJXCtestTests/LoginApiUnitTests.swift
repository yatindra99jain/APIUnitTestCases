//
//  LoginApiUnitTests.swift
//  YJXCtestTests
//
//  Created by Yatindra on 08/10/22.
//

import XCTest
@testable import YJXCtest

class LoginApiUnitTests: XCTestCase {
    
    var request : LoginRequest!
    var resource : LoginHandler!

    override func setUp() {
        super.setUp()
        TestConstant.shared.resetVariables()
        request = LoginRequest(email: "Developer5@gmail.com", password: "123456")
        resource = LoginHandler()
    }
    
    override func tearDown() {
        super.tearDown()
        request = nil
        resource = nil
    }
    
    func test_LoginApiResource_With_ValidRequest_Returns_LoginResponse() {
        
        // ARRANGE
        let expectation = self.expectation(description: "test_LoginApiResource_With_ValidRequest_Returns_LoginResponse")
        
        //ACTION
        resource.callLoginWebService(request) { (loginResponse) in
            
            // ASSERT
            XCTAssertNotNil(loginResponse?.response)
            XCTAssertEqual(loginResponse?.response?.code, 0)
            XCTAssertEqual(self.request.email, loginResponse?.response?.data?.Email ?? "")
            XCTAssertNotNil(loginResponse?.response?.data?.Token)
            
            expectation.fulfill()
            TestConstant.shared.authToken = loginResponse?.response?.data?.Token ?? ""
        }
        waitForExpectations(timeout: 10, handler: nil)
        
    }
    
}
