//
//  Species.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 29.09.23.
//

import UIKit

class Species: BaseModel {
    static let numberOfDetails = 14
    
    var name: String  { jsonDict["name"] as! String }
    
    var classification: String { jsonDict["classification"] as! String }
    
    var designation: String { jsonDict["designation"] as! String }
    
    var averageHeight: Int { Int(jsonDict["average_height"] as! String) ?? 0 }
    
    var skinColors: String { jsonDict["skin_colors"] as! String }
    
    var hairColors: String { jsonDict["hair_colors"] as! String }
    
    var eyeColors: String { jsonDict["eye_colors"] as! String }
    
    var averageLifespan: Int { Int(jsonDict["average_lifespan"] as! String) ?? 0 }
    
    var language: String { jsonDict["language"] as! String }
    
    var homeworld: [String] {
        get {
            let homeworlds = jsonDict["homeworld"] as! [String]
            var homeworldsIds: [String] = []
            homeworlds.forEach { homeworld in
                let components = homeworld.components(separatedBy: "/")
                
                homeworldsIds.append(components[components.count - 2])
            }
            
            return homeworldsIds
        }
    }
    
    var people: [String] {
        get {
            let peoples = jsonDict["people"] as! [String]
            var peoplesIds: [String] = []
            peoples.forEach { people in
                let components = people.components(separatedBy: "/")
                
                peoplesIds.append(components[components.count - 2])
            }
            
            return peoplesIds
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
    
    var url: String { jsonDict["name"] as! String }
}
