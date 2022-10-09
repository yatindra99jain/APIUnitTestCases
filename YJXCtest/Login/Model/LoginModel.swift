//
//  LoginResponse.swift
//  YJXCtest
//
//  Created by Yatindra on 07/10/22.
//

import Foundation

struct LoginRequest : Codable {
    let email, password : String
}

struct LoginResponse : Codable {
    
    let code : Int?
    let message : String?
    let data : LoginResponseData?
    
}

struct LoginResponseData : Codable {
    
    let Id : Int?
    let Name : String?
    let Email : String?
    let Token : String?
    
}


struct LoginData {
    let errorMessage:String?
    let response : LoginResponse?
}
