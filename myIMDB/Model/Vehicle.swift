//
//  Vehicle.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 29.09.23.
//

import UIKit

/// Class for a vehicle
class Vehicle: BaseModel {
    /// Name of this vehicle
    @objc var name: String { jsonDict["name"] as? String ?? "" }
    
    /// Model name of this vehicle
    @objc var model: String { jsonDict["model"] as? String ?? "" }
    
    /// Name of the manufacturer of this vehicle
    @objc var manufacturer: String { jsonDict["manufacturer"] as? String ?? "" }
    
    /// How expensive is this vehicle in **credits**
    @objc var costInCredits: Int { Int(jsonDict["cost_in_credits"] as? String ?? "") ?? 0 }
    
    /// Lenght of this vehicle in **m**
    @objc var length: Float { Float(jsonDict["length"] as? String ?? "") ?? 0.0 }
    
    /// Maximum speed in athmosphere of this vehicle in **km/h**
    @objc var maxAtmospheringSpeed: Int { Int(jsonDict["max_atmosphering_speed"] as? String ?? "") ?? 0 }
    
    /// Number of crew in this vehicle
    @objc var crew: Int { Int(jsonDict["crew"] as? String ?? "") ?? 0 }
    
    /// Number of passengers in this vehicle
    @objc var passengers: Int { Int(jsonDict["passengers"] as? String ?? "") ?? 0 }
    
    /// Maximum cargo capacity of this vehicle in **kg**
    @objc var cargoCapacity: Int { Int(jsonDict["cargo_capacity"] as? String ?? "") ?? 0 }
    
    /// How long would this vehicle stay usable without loading in **days** or **hours**
    @objc var consumables: String { jsonDict["consumables"] as? String ?? "" }
    
    /// Class of this vehicle
    @objc var vehicleClass: String { jsonDict["vehicle_class"] as? String ?? "" }
    
    /// List of pilots of this vehicle as an array of ``Character`` id
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
    
    /// List of films where this vehicle is a part of as array of ``Film`` id
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
    
    /// Date this entry in **SWAPI** was edited the last time
    @objc var editedAt: String { jsonDict["edited"] as? String ?? "" }
    
    /// Url to this vehicle entry in **SWAPI** as string
    @objc var url: String { jsonDict["url"] as? String ?? "" }
}
