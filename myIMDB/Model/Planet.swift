//
//  Planet.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 29.09.23.
//

import UIKit

/// Class for a planet in a film
class Planet: BaseModel {
    /// Name of the planet
    @objc var name: String { jsonDict["name"] as? String ?? "" }
    
    /// Length of a rotation period similar to a year on Earth in **days**
    @objc var rotationPeriod: Int { Int(jsonDict["rotation_period"] as? String ?? "") ?? 0 }
    
    /// Length of an orbital period similar to a day on Earth in **hours**
    @objc var orbitalPeriod: Int { Int(jsonDict["orbital_period"] as? String ?? "") ?? 0 }
    
    /// Diameter of this planet in **km**
    @objc var diameter: Int { Int(jsonDict["diameter"] as? String ?? "") ?? 0 }
    
    /// Climate of this planet
    @objc var climate: String { jsonDict["climate"] as? String ?? "" }
    
    /// Gravity of this planet compared to Earth gravity as **standard**
    @objc var gravity: String { jsonDict["gravity"] as? String ?? "" }
    
    /// List of terrains on this planet separated by comma
    @objc var terrain: String { jsonDict["terrain"] as? String ?? "" }
    
    /// Percentage of water coverage to landmass in **%**
    @objc var hasSurfaceWater: Int { Int(jsonDict["surface_water"] as? String ?? "") ?? 0 }
    
    /// Number of inhabitants of this planet
    @objc var population: Int { Int(jsonDict["population"] as? String ?? "") ?? 0 }
    
    ///List of characters from this planet playing a role in this film as an array of ``Character`` id
    @objc var residents: [String] {
        get {
            let residents = jsonDict["residents"] as? [String] ?? [String]()
            var residentsIds: [String] = []
            residents.forEach { resident in
                let components = resident.components(separatedBy: "/")
                
                residentsIds.append(components[components.count - 2])
            }
            
            return residentsIds
        }
    }
    
    /// List of films this planet playing a role in as an array of ``Film`` id
    @objc var films: [String] {
        get {
            let films = jsonDict["films"] as? [String] ?? [String]()
            var filmIds: [String] = []
            films.forEach { film in
                let components = film.components(separatedBy: "/")
                
                filmIds.append(components[components.count - 2])
            }
            
            return filmIds
        }
    }
    
    /// Date this entry in **SWAPI** was created
    @objc var createdAt: String { jsonDict["created"] as? String ?? "" }
    
    /// Date this entry in **SWAPI** was edited the last time
    @objc var editedAt: String { jsonDict["edited"] as? String ?? "" }
    
    /// Url to this planet entry in **SWAPI** as string
    @objc var url: String { jsonDict["url"] as? String ?? "" }
}
