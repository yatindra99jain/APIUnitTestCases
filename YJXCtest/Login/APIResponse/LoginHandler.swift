//
//  LoginHandler.swift
//  YJXCtest
//
//  Created by Yatindra on 07/10/22.
//

import Foundation

struct LoginHandler {
    
    private let handler = GlobalApiHandler.shared
    
    func validate(request:LoginRequest) -> ValidationResponse {
        
        guard !request.email.isEmpty && !request.password.isEmpty else {
            return ValidationResponse(message: "Email and password are empty", isValid: false)
        }
        
        return ValidationResponse(message: nil, isValid: true)
    }
    
    
    func callLoginWebService(_ request: LoginRequest, completionHandler:@escaping(_ loginResponse : LoginData?) -> ()) {
        
        let validationResult = self.validate(request: request)
        if(validationResult.isValid){
            
            let ApiRequest = handler.generateUrlRequestPOST(request: request, requestType: LoginRequest.self, apiRoute: .login)
            
            handler.callWebService(request: ApiRequest,responseType: LoginResponse.self){ result in
                print(result ?? "empty")
                GlobalApiHandler.shared.authToken = result?.data?.Token
                completionHandler(LoginData(errorMessage: nil, response: result))
            }
        } else {
            completionHandler(LoginData(errorMessage: validationResult.message, response: nil))
            
        }
    }
}
