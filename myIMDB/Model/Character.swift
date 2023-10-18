//
//  Character.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 29.09.23.
//

import UIKit

class Character: BaseModel {
    static let numberOfDetails = 15
    
    var name: String { jsonDict["name"] as! String }
    
    var height: String { jsonDict["height"] as! String }
    
    var mass: String { jsonDict["mass"] as! String }
    
    var hairColor: String { jsonDict["hair_color"] as! String }
    
    var skinColor: String { jsonDict["skin_color"] as! String }
    
    var eyeColor: String { jsonDict["eye_color"] as! String }
    
    var birthYear: String { jsonDict["birth_year"] as! String }
    
    var gender: String { jsonDict["gender"] as! String }
    
    var homeworld: String {
        get {
            let home = jsonDict["homeworld"] as! String
            let components = home.components(separatedBy: "/")
            
            return components[components.count - 2]
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
    
    var species: [String] {
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
    
    var vehicles: [String] {
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
    
    var starships: [String] {
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
    
    var createdAt: String { jsonDict["created"] as! String }
    
    var editedAt: String { jsonDict["edited"] as! String }
    
    var url: String { jsonDict["url"] as! String }
}
