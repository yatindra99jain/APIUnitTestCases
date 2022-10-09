//
//  ViewController.swift
//  YJXCtest
//
//  Created by Yatindra on 07/10/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let request = LoginRequest(email: "Developer5@gmail.com", password: "123456")
        let resource = LoginHandler()
        
        resource.callLoginWebService(request) { result in
            //print(result ?? "empty")
            
            let userRequest = usersRequest(page: 1)
            let userRespones = UserHandler()
            
            userRespones.callUsersWebService(userRequest){
                result in
                print("users result -> \(result)")
            }
            
        }
        
    }


}

