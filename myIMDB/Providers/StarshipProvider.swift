//
//  StarshipProvider.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 16.10.23.
//

import UIKit

class StarshipProvider: NSObject {
    private var httpClinet: HttpClient
    
    private var area: String = "starships/"
    
    static let sharedObject = StarshipProvider()
    
    private var starships: [String: Starship]
    
    override init() {
        self.httpClinet = HttpClient.sharedObject
        self.starships = [:]
        
        super.init()
    }
    
    func fetchStarship(withId id: String, completion: ((Starship?, Error?) -> Void)?) {
        if let starship = starships[id] {
            completion?(starship, nil)
            
            return
        }
        
        httpClinet.Get(withPath: area+id, withParameters: nil) { responseObject, error in
            if error != nil {
                completion?(nil, error)
                
                return
            }
            
            let starship = Starship(with: responseObject as! [String: Any])
            
            if self.starships[id] == nil {
                self.starships[id] = starship
            }
            
            completion?(starship, nil)
        }
    }
}
