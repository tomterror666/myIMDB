//
//  SpeciesProvider.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 16.10.23.
//

import UIKit

class SpeciesProvider: NSObject {
    private var httpClinet: HttpClient
    
    private var area: String = "species/"
    
    static let sharedObject = SpeciesProvider()
    
    private var allSpecies: [String: Species]
    
    override init() {
        self.httpClinet = HttpClient.sharedObject
        self.allSpecies = [:]
        
        super.init()
    }
    
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
