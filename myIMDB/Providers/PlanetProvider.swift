//
//  PlanetProvider.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 12.10.23.
//

import UIKit

class PlanetProvider: NSObject {
    private var httpClinet: HttpClient
    
    private var area: String = "planets/"
    
    static let sharedObject = PlanetProvider()
    
    private var planets: [String: Planet]
    
    override init() {
        self.httpClinet = HttpClient.sharedObject
        self.planets = [:]
        
        super.init()
    }
    
    func fetchPlanet(withId id: String, completion: ((Planet?, Error?) -> Void)?) {
        if let planet = planets[id] {
            completion?(planet, nil)
            
            return
        }
        
        httpClinet.Get(withPath: area+id, withParameters: nil) { responseObject, error in
            if error != nil {
                completion?(nil, error)
                
                return
            }
            
            let planet = Planet(with: responseObject as! [String: Any])
            
            if self.planets[id] == nil {
                self.planets[id] = planet
            }
            
            completion?(planet, nil)
        }
    }
}
