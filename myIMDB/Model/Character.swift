//
//  Character.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 29.09.23.
//

import UIKit

class Character: BaseModel {
    static let numberOfDetails = 15
    
    @objc var name: String { jsonDict["name"] as! String }
    
    @objc var height: Int { Int(jsonDict["height"] as! String)! }
    
    @objc var mass: Int { Int(jsonDict["mass"] as! String)! }
    
    @objc var hairColor: String { jsonDict["hair_color"] as! String }
    
    @objc var skinColor: String { jsonDict["skin_color"] as! String }
    
    @objc var eyeColor: String { jsonDict["eye_color"] as! String }
    
    @objc var birthYear: String { jsonDict["birth_year"] as! String }
    
    @objc var gender: String { jsonDict["gender"] as! String }
    
    @objc var homeworld: String {
        get {
            let home = jsonDict["homeworld"] as! String
            let components = home.components(separatedBy: "/")
            
            return components[components.count - 2]
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
    
    @objc var species: [String] {
        get {
            let specieses = jsonDict["species"] as! [String]
            var speciesesIds: [String] = []
            specieses.forEach { species in
                let components = species.components(separatedBy: "/")
                
                speciesesIds.append(components[components.count - 2])
            }
            
            return speciesesIds
        }
    }
    
    @objc var vehicles: [String] {
        get {
            let vehicles = jsonDict["vehicles"] as! [String]
            var vehiclesIds: [String] = []
            vehicles.forEach { vehicle in
                let components = vehicle.components(separatedBy: "/")
                
                vehiclesIds.append(components[components.count - 2])
            }
            
            return vehiclesIds
        }
    }
    
    @objc var starships: [String] {
        get {
            let starships = jsonDict["starships"] as! [String]
            var starshipsIds: [String] = []
            starships.forEach { starship in
                let components = starship.components(separatedBy: "/")
                
                starshipsIds.append(components[components.count - 2])
            }
            
            return starshipsIds
        }
    }
    
    @objc var createdAt: String { jsonDict["created"] as! String }
    
    @objc var editedAt: String { jsonDict["edited"] as! String }
    
    @objc var url: String { jsonDict["url"] as! String }
}
