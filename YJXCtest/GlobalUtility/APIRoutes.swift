//
//  Constant.swift
//  YJXCtest
//
//  Created by Yatindra on 08/10/22.
//

import Foundation


public enum Environment : String {
    case development = "http://122.176.47.222/api/"
    case staging = "staging"
    case prod = "prod"
}



/*
 APIS
 
 https://www.appsloveworld.com/sample-rest-api-url-for-testing-with-authentication#huserlogin
 
 LOGIN -
 http://restapi.adequateshop.com/api/authaccount/login
 {
 "email":"Developer5@gmail.com",
 "password":123456
 }
 
 -------------------------
 
 SIGNUP -
 http://restapi.adequateshop.com/api/authaccount/registration
 
 {
 
 "name":"Developer",
 "email":"Developer5@gmail.com",
 "password":123456
 }
 
 -------------------------
 
 
 GET USERS -
 http://restapi.adequateshop.com/api/users?page=1
 
 headers: {
 'Authorization': 'Bearer <token>'
 }
 
 */

public enum RequestStatus: Int{
    case OK             = 200
    case noAccount      = 201
    case error          = 202
    case notVerified    = 204
    case tokenExpire    = 300
    case ipFailed       = 302
    case requestDenied  = 401
    case invalidRequest = 400
}

public enum apiTypes : String {
    case post = "post"
    case get = "get"
}


public enum apiRoutes : String,Codable {
    
    case login = "authaccount/login"
    case signup = "authaccount/registration"
    case getAlluser = "users"
    
}
