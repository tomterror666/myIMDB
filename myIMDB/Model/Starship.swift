//
//  Starship.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 29.09.23.
//

import UIKit

class Starship: BaseModel {
    static let numberOfDetails = 17
    
    var name: String { jsonDict["name"] as! String }
    
    var model: String { jsonDict["model"] as! String }
    
    var manufacturer: String { jsonDict["manufacturer"] as! String }
    
    var costInCredits: Int { Int(jsonDict["cost_in_credits"] as! String) ?? 0 }
    
    var length: Float { Float(jsonDict["length"] as! String) ?? 0.0 }
    
    var maxAtmospheringSpeed: String { jsonDict["max_atmosphering_speed"] as! String }
    
    var crew: Int { Int(jsonDict["crew"] as! String) ?? 0 }
    
    var passengers: Int { Int(jsonDict["passengers"] as! String) ?? 0 }
    
    var cargoCapacity: Int { Int(jsonDict["cargo_capacity"] as! String) ?? 0 }
    
    var consumables: String { jsonDict["consumables"] as! String }
    
    var hyperdriveRating: Float { Float(jsonDict["hyperdrive_rating"] as! String) ?? 0.0 }
    
    var MGLT: Int { Int(jsonDict["MGLT"] as! String) ?? 0 }
    
    var starshipClass: String { jsonDict["starship_class"] as! String }
    
    var pilots: [String] {
        get {
            let pilots = jsonDict["pilots"] as! [String]
            var pilotsIds: [String] = []
            pilots.forEach { pilot in
                let components = pilot.components(separatedBy: "/")
                
                pilotsIds.append(components[components.count - 2])
            }
            
            return pilotsIds
        }
    }
    
    var films: [String] {
        get {
            let films = jsonDict["films"] as! [String]
            var filmsIds: [String] = []
            films.forEach { film in
                let components = film.components(separatedBy: "/")
                
                filmsIds.append(components[components.count - 2])
            }
            
            return filmsIds
        }
    }
 
    var createdAt: String { jsonDict["created"] as! String }
    
    var editedAt: String { jsonDict["edited"] as! String }
    
    var url: String { jsonDict["url"] as! String }
}
