//
//  HttpClient.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 29.09.23.
//

import UIKit
import Alamofire

/// Client for obtaining data using resful http calls
class HttpClient: NSObject {
    /// The base path to **SWAPI** api
    fileprivate let apiBaseUrl = "https://swapi.dev/api/"
    
    /// Singelton for common usage
    static let sharedObject = HttpClient()
    
    /// Restful GET call
    ///
    /// - parameter path:       Path of the restful GET call
    /// - parameter parameter:  Query parameters
    /// - parameter completion: Completion - called when finished with data or error
    func Get(withPath path: String, withParameters parameter: [String: Any]?, completion: ((_ responseObject: Any?, _ error: Error?) -> Void)?) {
        if isUITest() && isMoctailAvailable(forUrl: path), let mocktailData = mocktailData(forUrl: path) {
            do {
                let jsonResult = try JSONSerialization.jsonObject(with: mocktailData)
                
                completion?(jsonResult, nil)
            } catch {
                completion?(nil, error)
            }
        }
        
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
    
    /// Restful HEAD call
    ///
    /// - parameter path:       Path of the restful HEAD call
    /// - parameter parameter:  Query parameters
    /// - parameter completion: Completion - called when on data or error
    func Head(inArea area: String, completion: (_ responseObject: Any?, _ error: Error?) -> Void) {
        
    }
    
    /// Restful POST call
    ///
    /// - parameter path:       Path of the restful POST call
    /// - parameter parameter:  Query parameters
    /// - parameter completion: Completion - called when on data or error
    func Post(inArea area: String, withParameters parameter: [String: Any]?, completion: (_ responseObject: Any?, _ error: Error?) -> Void) {
        
    }
    
    // MARK: - mocktail handling
    
    private func isUITest() -> Bool {
        return ProcessInfo.processInfo.arguments.contains("enable-testing")
    }
    
    private func urlToMocktailName(forUrl url: String) -> String {
        return url.replacingOccurrences(of: "/", with: "_")
    }
    
    private func isMoctailAvailable(forUrl url: String) -> Bool {
        let mocktailName = urlToMocktailName(forUrl: url)
        //return Bundle.main.path(forResource: mocktailName, ofType: "tail") != nil
        return Bundle.main.path(forResource: mocktailName, ofType: "tail") != nil
    }
    
    private func mocktailData(forUrl url: String) -> Data? {
        let mocktailName = urlToMocktailName(forUrl: url)
        if let bundlePath = Bundle.main.path(forResource: mocktailName, ofType: "tail") {
            return NSData(contentsOfFile: bundlePath) as Data?
        }
        return nil
    }
}
