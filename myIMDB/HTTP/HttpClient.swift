//
//  HttpClient.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 29.09.23.
//

import UIKit
import Alamofire

class HttpClient: NSObject {
    fileprivate let apiBaseUrl = "https://swapi.dev/api/"
    
    static let sharedObject = HttpClient()
    

    func Get(withPath path: String, withParameters parameter: [String: Any]?, completion: ((_ responseObject: Any?, _ error: Error?) -> Void)?) {
        AF.request(apiBaseUrl+path, method: .get).response { response in
            if let responseData = response.data {
                do {
                    let jsonResult = try JSONSerialization.jsonObject(with: responseData)
                    
                    completion?(jsonResult, nil)
                } catch {
                    completion?(nil, error)
                }
            }
        }
    }
    
    func Head(inArea area: String, completion: (_ responseObject: Any?, _ error: Error?) -> Void) {
        
    }
    
    func Post(inArea area: String, withParameters parameter: [String: Any]?, completion: (_ responseObject: Any?, _ error: Error?) -> Void) {
        
    }
}
