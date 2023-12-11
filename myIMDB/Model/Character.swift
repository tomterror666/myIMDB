//
//  Character.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 29.09.23.
//

import UIKit

class Character: BaseModel {
    /// Name of the character
    @objc var name: String { jsonDict["name"] as? String ?? "" }
    
    /// Height of the character in **cm**
    @objc var height: Int { Int(jsonDict["height"] as? String ?? "") ?? 0 }
    
    /// Mass of the character in **kg**
    @objc var mass: Int { Int(jsonDict["mass"] as? String ?? "") ?? 0 }
    
    /// Hair color of the character
    @objc var hairColor: String { jsonDict["hair_color"] as? String ?? "" }
    
    /// Skin color of the character
    @objc var skinColor: String { jsonDict["skin_color"] as? String ?? "" }
    
    /// Eye color of the character
    @objc var eyeColor: String { jsonDict["eye_color"] as? String ?? "" }
    
    /// Birth year of the character using the in-universe standard of **BBY** or **ABY** - **B**efore the **B**attle of **Y**arvin or **A**fter the **B**attle of **Y**arwin
    @objc var birthYear: String { jsonDict["birth_year"] as? String ?? "" }
    
    /// Gender of the character
    @objc var gender: String { jsonDict["gender"] as? String ?? "" }
    
    /// Homeworld of the character as ``Planet`` id
    @objc var homeworld: [String] {
        get {
            if let home = jsonDict["homeworld"] as? String {
                let components = home.components(separatedBy: "/")
                
                return [components[components.count - 2]]
            }
            
            return [String]()
        }
    }
    
    /// List of films where that character is a member of as array of ``Film`` id
    @objc var films: [String] {
        get {
            let films = jsonDict["films"] as? [String]  ?? [String]()
            var filmIds: [String] = []
            films.forEach { film in
                let components = film.components(separatedBy: "/")
                
                filmIds.append(components[components.count - 2])
            }
            
            return filmIds
        }
    }
    
    /// List of species the character belongs to as array of ``Species`` id
    @objc var species: [String] {
        get {
            let specieses = jsonDict["species"] as? [String]  ?? [String]()
            var speciesesIds: [String] = []
            specieses.forEach { species in
                let components = species.components(separatedBy: "/")
                
                speciesesIds.append(components[components.count - 2])
            }
            
            return speciesesIds
        }
    }
    
    /// List of vehicles the character is able to use as array of ``Vehicle`` id
    @objc var vehicles: [String] {
        get {
            let vehicles = jsonDict["vehicles"] as? [String] ?? [String]()
            var vehiclesIds: [String] = []
            vehicles.forEach { vehicle in
                let components = vehicle.components(separatedBy: "/")
                
                vehiclesIds.append(components[components.count - 2])
            }
            
            return vehiclesIds
        }
    }
    
    /// List of starships the character is able to fly as array of ``Starship`` id
    @objc var starships: [String] {
        get {
            let starships = jsonDict["starships"] as? [String] ?? [String]()
            var starshipsIds: [String] = []
            starships.forEach { starship in
                let components = starship.components(separatedBy: "/")
                
                starshipsIds.append(components[components.count - 2])
            }
            
            return starshipsIds
        }
    }
    
    /// Date this entry in **SWAPI** was created
    @objc var createdAt: String { jsonDict["created"] as? String ?? "" }
    
    /// Date this entry in **SWAPI** was edited the last time
    @objc var editedAt: String { jsonDict["edited"] as? String ?? "" }
    
    /// Url to this character entry in **SWAPI** as string
    @objc var url: String { jsonDict["url"] as? String ?? "" }
}
