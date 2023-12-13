//
//  PlanetProvider.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 12.10.23.
//

import UIKit

/// Class for retrieving and storing planets from **SWAPI**
class PlanetProvider: NSObject {
    /// Used client for doing the restful API calls
    private var httpClinet: HttpClient
    
    /// Path to the Characters API endpoint
    private var path: String = "planets/"
    
    /// Singelton for common usage
    static let sharedObject = PlanetProvider()
    
    /// Currently stored list of characters as dictionary of ``String`` id to ``Planet`` objects
    private var planets: [String: Planet]
    
    /// Overriden func **init**
    override init() {
        self.httpClinet = HttpClient.sharedObject
        self.planets = [:]
        
        super.init()
    }
    
    /// Fetching a planet which is stored if possible or if already fetched it is taken from storage
    ///
    /// - parameters id:                    ID of the planet to fetch
    /// - parameters completion:    Completion which is called on end with data as ``Planet`` or error
    func fetchPlanet(withId id: String, completion: ((Planet?, Error?) -> Void)?) {
        if let planet = planets[id] {
            completion?(planet, nil)
            
            return
        }
        
        httpClinet.Get(withPath: path+id, withParameters: nil) { responseObject, error in
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
