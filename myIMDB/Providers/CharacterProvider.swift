//
//  CharacterProvider.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 05.10.23.
//

import UIKit

class CharacterProvider: NSObject {
    private var httpClinet: HttpClient
    
    private var area: String = "people/"
    
    static let sharedObject = CharacterProvider()
    
    private var characters: [String: Character]
    
    override init() {
        self.httpClinet = HttpClient.sharedObject
        self.characters = [:]
        
        super.init()
    }
    
    func fetchCharacter(withId id: String, completion: ((Character?, Error?) -> Void)?) {
        if let character = characters[id] {
            completion?(character, nil)
            
            return
        }
        
        httpClinet.Get(withPath: area+id, withParameters: nil) { responseObject, error in
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
