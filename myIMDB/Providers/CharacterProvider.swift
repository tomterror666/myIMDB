//
//  CharacterProvider.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 05.10.23.
//

import UIKit

/// Class for retrieving and storing characters from **SWAPI**
class CharacterProvider: NSObject {
    /// Used client for doing the restful API calls
    private var httpClinet: HttpClient
    
    /// Path to the Characters API endpoint
    private var path: String = "people/"
    
    /// Singelton for common usage
    static let sharedObject = CharacterProvider()
    
    /// Currently stored list of characters as dictionary of ``String`` id to ``Character`` objects
    private var characters: [String: Character]
    
    /// Overriden func **init**
    override init() {
        self.httpClinet = HttpClient.sharedObject
        self.characters = [:]
        
        super.init()
    }
    
    /// Fetching a character which is stored if possible or if already fetched it is taken from storage
    ///
    /// - parameters id:                    ID of the character to fetch
    /// - parameters completion:    Completion which is called on end with data as ``Character`` or error
    func fetchCharacter(withId id: String, completion: ((Character?, Error?) -> Void)?) {
        if let character = characters[id] {
            completion?(character, nil)
            
            return
        }
        
        httpClinet.Get(withPath: path+id, withParameters: nil) { responseObject, error in
            if error != nil {
                completion?(nil, error)
                
                return
            }
            
            let character = Character(with: responseObject as! [String: Any])
            
            if self.characters[id] == nil {
                self.characters[id] = character
            }
            
            completion?(character, nil)
        }
    }
}
