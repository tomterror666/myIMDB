//
//  StarshipProvider.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 16.10.23.
//

import UIKit

/// Class for retrieving and storing starships from **SWAPI**
class StarshipProvider: NSObject {
    /// Used client for doing the restful API calls
    private var httpClinet: HttpClient
    
    /// Path to the Characters API endpoint
    private var path: String = "starships/"
    
    /// Singelton for common usage
    static let sharedObject = StarshipProvider()
    
    /// Currently stored list of characters as dictionary of ``String`` id to ``Starship`` objects
    private var starships: [String: Starship]
    
    /// Overriden func **init**
    override init() {
        self.httpClinet = HttpClient.sharedObject
        self.starships = [:]
        
        super.init()
    }
    
    /// Fetching a starship which is stored if possible or if already fetched it is taken from storage
    ///
    /// - parameters id:                    ID of the starship to fetch
    /// - parameters completion:    Completion which is called on end with data as ``Starship`` or error
    func fetchStarship(withId id: String, completion: ((Starship?, Error?) -> Void)?) {
        if let starship = starships[id] {
            completion?(starship, nil)
            
            return
        }
        
        httpClinet.Get(withPath: path+id, withParameters: nil) { responseObject, error in
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
