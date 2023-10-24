//
//  Vehicle.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 29.09.23.
//

import UIKit

class Vehicle: BaseModel {
    static let numberOfDetails = 15
    
    @objc var name: String { jsonDict["name"] as! String }
    
    @objc var model: String { jsonDict["model"] as! String }
    
    @objc var manufacturer: String { jsonDict["manufacturer"] as! String }
    
    @objc var costInCredits: Int { Int(jsonDict["cost_in_credits"] as! String) ?? 0 }
    
    @objc var length: Float { Float(jsonDict["length"] as! String) ?? 0.0 }
    
    @objc var maxAtmospheringSpeed: Int { Int(jsonDict["max_atmosphering_speed"] as! String) ?? 0 }
    
    @objc var crew: Int { Int(jsonDict["crew"] as! String) ?? 0 }
    
    @objc var passengers: Int { Int(jsonDict["passengers"] as! String) ?? 0 }
    
    @objc var cargoCapacity: Int { Int(jsonDict["cargo_capacity"] as! String) ?? 0 }
    
    @objc var consumables: String { jsonDict["consumables"] as! String }
    
    @objc var vehicleClass: String { jsonDict["vehicle_class"] as! String }
    
    @objc var pilots: [String] {
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
    
    @objc var films: [String] {
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
    
    @objc var createdAt: String { jsonDict["created"] as! String }
    
    @objc var editedAt: String { jsonDict["edited"] as! String }
    
    @objc var url: String { jsonDict["url"] as! String }
}
