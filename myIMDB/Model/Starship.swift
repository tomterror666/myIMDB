//
//  Starship.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 29.09.23.
//

import UIKit

/// Class for a starship
class Starship: BaseModel {
    /// Name of this starship
    @objc var name: String { jsonDict["name"] as? String ?? "" }
    
    /// Model name of this starship
    @objc var model: String { jsonDict["model"] as? String ?? "" }
    
    /// Name of the manufacturer of this starship
    @objc var manufacturer: String { jsonDict["manufacturer"] as? String ?? "" }
    
    /// How expensive is this starship in **credits**
    @objc var costInCredits: Int { Int(jsonDict["cost_in_credits"] as? String ?? "") ?? 0 }
    
    /// Lenght of this starship in **m**
    @objc var length: Float { Float(jsonDict["length"] as? String ?? "") ?? 0.0 }
    
    /// Maximum speed in athmosphere of this starship in **km/h**
    @objc var maxAtmospheringSpeed: String { jsonDict["max_atmosphering_speed"] as? String ?? "" }
    
    /// Number of crew in this starship
    @objc var crew: Int { Int(jsonDict["crew"] as? String ?? "") ?? 0 }
    
    /// Number of passengers in this startship
    @objc var passengers: Int { Int(jsonDict["passengers"] as? String ?? "") ?? 0 }
    
    /// Maximum cargo capacity of this starship in **kg**
    @objc var cargoCapacity: Int { Int(jsonDict["cargo_capacity"] as? String ?? "") ?? 0 }
    
    /// How long would this starship stay usable without loading in **days** or **hours**
    @objc var consumables: String { jsonDict["consumables"] as? String ?? "" }
    
    /// How fast is this starship in hyperdrive compared to lightspeed in **times c**
    @objc var hyperdriveRating: Float { Float(jsonDict["hyperdrive_rating"] as? String ?? "") ?? 0.0 }
    
    /// Maximum speed in space of this starship in **MGLT**
    @objc var MGLT: Int { Int(jsonDict["MGLT"] as? String ?? "") ?? 0 }
    
    /// Class of this starship
    @objc var starshipClass: String { jsonDict["starship_class"] as? String ?? "" }
    
    /// List of pilots of this starship as an array of ``Character`` id
    @objc var pilots: [String] {
        get {
            let pilots = jsonDict["pilots"] as? [String] ?? [String]()
            var pilotsIds: [String] = []
            pilots.forEach { pilot in
                let components = pilot.components(separatedBy: "/")
                
                pilotsIds.append(components[components.count - 2])
            }
            
            return pilotsIds
        }
    }
    
    /// List of films where this starship is a part of as array of ``Film`` id
    @objc var films: [String] {
        get {
            let films = jsonDict["films"] as? [String] ?? [String]()
            var filmsIds: [String] = []
            films.forEach { film in
                let components = film.components(separatedBy: "/")
                
                filmsIds.append(components[components.count - 2])
            }
            
            return filmsIds
        }
    }
 
    /// Date this entry in **SWAPI** was created
    @objc var createdAt: String { jsonDict["created"] as? String ?? "" }
    
    /// Date this entry in **SWAPI** was edited at
    @objc var editedAt: String { jsonDict["edited"] as? String ?? "" }
    
    /// Url to this starship entry in **SWAPI** as string
    @objc var url: String { jsonDict["url"] as? String ?? "" }
}
