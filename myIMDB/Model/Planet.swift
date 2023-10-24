//
//  Planet.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 29.09.23.
//

import UIKit

class Planet: BaseModel {
    static let numberOfDetails = 13
    
    @objc var name: String { jsonDict["name"] as! String }
    
    @objc var rotationPeriod: Int { Int(jsonDict["rotation_period"] as! String) ?? 0 }
    
    @objc var orbitalPeriod: Int { Int(jsonDict["orbital_period"] as! String) ?? 0 }
    
    @objc var diameter: Int { Int(jsonDict["diameter"] as! String) ?? 0 }
    
    @objc var climate: String { jsonDict["climate"] as! String }
    
    @objc var gravity: String { jsonDict["gravity"] as! String }
    
    @objc var terrain: String { jsonDict["terrain"] as! String }
    
    @objc var hasSurfaceWater: Int { Int(jsonDict["surface_water"] as! String) ?? 0 }
    
    @objc var population: Int { Int(jsonDict["population"] as! String) ?? 0 }
    
    @objc var residents: [String] {
        get {
            let residents = jsonDict["residents"] as! [String]
            var residentsIds: [String] = []
            residents.forEach { resident in
                let components = resident.components(separatedBy: "/")
                
                residentsIds.append(components[components.count - 2])
            }
            
            return residentsIds
        }
    }
    
    @objc var films: [String] {
        get {
            let films = jsonDict["films"] as! [String]
            var filmIds: [String] = []
            films.forEach { film in
                let components = film.components(separatedBy: "/")
                
                filmIds.append(components[components.count - 2])
            }
            
            return filmIds
        }
    }
    
    @objc var createdAt: String { jsonDict["created"] as! String }
    
    @objc var editedAt: String { jsonDict["edited"] as! String }
    
    @objc var url: String { jsonDict["url"] as! String }
}
