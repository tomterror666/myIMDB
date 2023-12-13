//
//  SpeciesProvider.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 16.10.23.
//

import UIKit

/// Class for retrieving and storing species from **SWAPI**
class SpeciesProvider: NSObject {
    /// Used client for doing the restful API calls
    private var httpClinet: HttpClient
    
    /// Path to the Characters API endpoint
    private var area: String = "species/"
    
    /// Singelton for common usage
    static let sharedObject = SpeciesProvider()
    
    /// Currently stored list of characters as dictionary of ``String`` id to ``Species`` objects
    private var allSpecies: [String: Species]
    
    /// Overriden func **init**
    override init() {
        self.httpClinet = HttpClient.sharedObject
        self.allSpecies = [:]
        
        super.init()
    }
    
    /// Fetching a species which is stored if possible or if already fetched it is taken from storage
    ///
    /// - parameters id:                    ID of the species to fetch
    /// - parameters completion:    Completion which is called on end with data as ``Species`` or error
    func fetchSpecies(withId id: String, completion: ((Species?, Error?) -> Void)?) {
        if let species = allSpecies[id] {
            completion?(species, nil)
            
            return
        }
        
        httpClinet.Get(withPath: area+id, withParameters: nil) { responseObject, error in
            if error != nil {
                completion?(nil, error)
                
                return
            }
            
            let species = Species(with: responseObject as! [String: Any])
            
            if self.allSpecies[id] == nil {
                self.allSpecies[id] = species
            }
            
            completion?(species, nil)
        }
    }
}
