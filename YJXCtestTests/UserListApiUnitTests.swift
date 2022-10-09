//
//  UserListApiUnitTests.swift
//  YJXCtestTests
//
//  Created by Yatindra on 09/10/22.
//

import XCTest
@testable import YJXCtest


class UserListApiUnitTests: XCTestCase {
    
    var request : usersRequest!
    var resource : UserHandler!
    var token : String!
    
    override func setUp() {
        super.setUp()
        token = TestConstant.shared.authToken
        request = usersRequest(page: 1)
        resource = UserHandler()
    }
    
    override func tearDown() {
        super.tearDown()
        request = nil
        resource = nil
    }
    
    func test_UserApiResource_With_ValidRequest_Returns_USersResponse() {
        
        // ARRANGE
        let expectation = self.expectation(description: "test_UserApiResource_With_ValidRequest_Returns_USersResponse")
        
        // ACTION
        resource.callUsersWebService(request){ usersResponse in
            
            XCTAssertNotNil(usersResponse)
            XCTAssertNotNil(usersResponse?.response?.data)
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10,handler: nil)
        
        
    }
    
    
    
    
}
