//
//  Species.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 29.09.23.
//

import UIKit

/// Class for a species
class Species: BaseModel {
    /// Name of this species
    @objc var name: String  { jsonDict["name"] as? String ?? "" }
    
    /// Biological classification of this species as ``String``
    @objc var classification: String { jsonDict["classification"] as? String ?? "" }

    /// Designation of this species
    @objc var designation: String { jsonDict["designation"] as? String ?? "" }
    
    /// Average height of this species in **cm**
    @objc var averageHeight: Int { Int(jsonDict["average_height"] as? String ?? "") ?? 0 }
    
    /// List of possible skin colors of this species separated by comma
    @objc var skinColors: String { jsonDict["skin_colors"] as? String ?? "" }
    
    /// List of possible hair colors of this species separated by comma
    @objc var hairColors: String { jsonDict["hair_colors"] as? String ?? "" }
    
    /// List of possible eye colors of this species separated by comma
    @objc var eyeColors: String { jsonDict["eye_colors"] as? String ?? "" }
    
    /// Average lifespan of this species in **years**
    @objc var averageLifespan: Int { Int(jsonDict["average_lifespan"] as? String ?? "") ?? 0 }
    
    /// Main language of this species
    @objc var language: String { jsonDict["language"] as? String ?? "" }
    
    /// Homeworld of this species as ``Planet`` id
    @objc var homeworld: [String] {
        get {
            if let home = jsonDict["homeworld"] as? String {
                let components = home.components(separatedBy: "/")
            
                return [components[components.count - 2]]
            }
            
            return [String]()
        }
    }
    
    /// List of people belonging to this species as an array of ``Character`` id
    @objc var people: [String] {
        get {
            let peoples = jsonDict["people"] as? [String]  ?? [String]()
            var peoplesIds: [String] = []
            peoples.forEach { people in
                let components = people.components(separatedBy: "/")
                
                peoplesIds.append(components[components.count - 2])
            }
            
            return peoplesIds
        }
    }
    
    /// List of films where this species is a member of as array of ``Film`` id
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
    
    /// Url to this species entry in **SWAPI** as string
    @objc var url: String { jsonDict["url"] as? String ?? "" }
}
