//
//  GlobalApiHandler.swift
//  YJXCtest
//
//  Created by Yatindra on 07/10/22.
//

import Foundation


struct GlobalApiHandler {
    
    static var shared = GlobalApiHandler()
    
    public var authToken : String?

    func callWebService<T:Codable>(request:URLRequest, responseType:T.Type, completionHandler:@escaping (_ result:T?)->(Void)){
        
        URLSession.shared.dataTask(with: request){
            (responseData, serverResponse, serverError) in
            
            if let httpResponse = serverResponse as? HTTPURLResponse {
                print("statusCode - \(httpResponse.statusCode)")
                let statusCode = RequestStatus(rawValue: httpResponse.statusCode)
                if(serverError == nil && responseData != nil && statusCode == .OK){
                    let result = try? JSONDecoder().decode(T.self, from: responseData!)
                    completionHandler(result)
                } else {
                    completionHandler(nil)
                }
            } else {
                completionHandler(nil)
            }
            
           
        }.resume()
    }
    
    
    func generateUrlRequestPOST<T:Codable>(request : T, requestType:T.Type, apiRoute: apiRoutes) -> URLRequest {
        
        var urlrequest = URLRequest(url: URL(string: Environment.development.rawValue + apiRoute.rawValue)!)
        urlrequest.httpMethod = apiTypes.post.rawValue
        urlrequest.addValue("application/json", forHTTPHeaderField: "content-type")
        urlrequest.httpBody = try? JSONEncoder().encode(request)
        return urlrequest
        
    }
    
    func generateUrlRequestGET<T:Codable>(request : T, requestType:T.Type, apiRoute: apiRoutes) -> URLRequest {
        
        var components = URLComponents(string: Environment.development.rawValue + apiRoute.rawValue)!
        
        if let requestData  = try? JSONEncoder().encode(request) {
            if let dict = (try? JSONSerialization.jsonObject(with: requestData)) as? [String: Any] {
                let items = dict.map { key,value in
                    URLQueryItem(name: key, value: "\(value)")
                }
                components.queryItems = items
            }
        }
        
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        var urlrequest = URLRequest(url: components.url!)
        
        urlrequest.httpMethod = apiTypes.get.rawValue
        urlrequest.addValue("application/json", forHTTPHeaderField: "content-type")
        print("authToken -> \(authToken ?? "")")
        if(authToken != nil){
            urlrequest.addValue("Bearer ".appending(authToken ?? ""), forHTTPHeaderField: "Authorization")
        }
        return urlrequest
        
    }
}
