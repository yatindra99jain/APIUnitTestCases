//
//  File.swift
//  YJXCtestTests
//
//  Created by Yatindra on 09/10/22.
//

import Foundation


public class TestConstant {
    
    static let shared = TestConstant()
    
    public var authToken : String?
    
    
    public func resetVariables(){
        authToken = nil
    }
    
}
