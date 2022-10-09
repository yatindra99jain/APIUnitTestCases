//
//  UserHandler.swift
//  YJXCtest
//
//  Created by Yatindra on 09/10/22.
//

import Foundation

struct UserHandler {
    
    private let handler = GlobalApiHandler.shared
    
    func callUsersWebService(_ request: usersRequest, completionHandler:@escaping(_ userResponse : usersData?) -> ()) {
        
        let ApiRequest = handler.generateUrlRequestGET(request: request, requestType: usersRequest.self, apiRoute: .getAlluser)
        
        handler.callWebService(request: ApiRequest,responseType: usersResponse.self){ result in
            print(result ?? "empty")
            completionHandler(usersData(errorMessage: nil, response: result))
        }
    }
    
}
