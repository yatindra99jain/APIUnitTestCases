//
//  UserModel.swift
//  YJXCtest
//
//  Created by Yatindra on 09/10/22.
//

import Foundation


struct usersRequest : Codable {
    let page : Int
}

struct usersResponse :Codable {
    
    let page :Int?
    let per_page :Int?
    let totalrecord :Int?
    let total_pages :Int?
    let data :[usersResponseData]?
    
}

struct usersResponseData :Codable {
    
    let id :Int?
    let name :String?
    let email :String?
    let profilepicture :String?
    let location :String?
    let createdat :String?
}

struct usersData{
    let errorMessage:String?
    let response : usersResponse?
}

