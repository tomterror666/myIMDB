//
//  Planet.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 29.09.23.
//

import UIKit

class Planet: BaseModel {
    static let numberOfDetails = 13
    
    var name: String { jsonDict["name"] as! String }
    
    var rotationPeriod: Int { Int(jsonDict["rotation_period"] as! String) ?? 0 }
    
    var orbitalPeriod: Int { Int(jsonDict["orbital_period"] as! String) ?? 0 }
    
    var diameter: Int { Int(jsonDict["diameter"] as! String) ?? 0 }
    
    var climate: String { jsonDict["climate"] as! String }
    
    var gravity: String { jsonDict["gravity"] as! String }
    
    var terrain: String { jsonDict["terrain"] as! String }
    
    var hasSurfaceWater: Int { Int(jsonDict["surface_water"] as! String) ?? 0 }
    
    var population: Int { Int(jsonDict["population"] as! String) ?? 0 }
    
    var residents: [String] {
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
    
    var films: [String] {
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
    
    var createdAt: String { jsonDict["created"] as! String }
    
    var editedAt: String { jsonDict["edited"] as! String }
    
    var url: String { jsonDict["url"] as! String }
}
