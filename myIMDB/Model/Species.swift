//
//  Species.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 29.09.23.
//

import UIKit

class Species: BaseModel {
    static let numberOfDetails = 14
    
    @objc var name: String  { jsonDict["name"] as? String ?? "" }
    
    @objc var classification: String { jsonDict["classification"] as? String ?? "" }
    
    @objc var designation: String { jsonDict["designation"] as? String ?? "" }
    
    @objc var averageHeight: Int { Int(jsonDict["average_height"] as? String ?? "") ?? 0 }
    
    @objc var skinColors: String { jsonDict["skin_colors"] as? String ?? "" }
    
    @objc var hairColors: String { jsonDict["hair_colors"] as? String ?? "" }
    
    @objc var eyeColors: String { jsonDict["eye_colors"] as? String ?? "" }
    
    @objc var averageLifespan: Int { Int(jsonDict["average_lifespan"] as? String ?? "") ?? 0 }
    
    @objc var language: String { jsonDict["language"] as? String ?? "" }
    
    @objc var homeworld: [String] {
        get {
            if let home = jsonDict["homeworld"] as? String {
                let components = home.components(separatedBy: "/")
            
                return [components[components.count - 2]]
            }
            
            return [String]()
        }
    }
    
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
    
    @objc var createdAt: String { jsonDict["created"] as? String ?? "" }
    
    @objc var editedAt: String { jsonDict["edited"] as? String ?? "" }
    
    @objc var url: String { jsonDict["url"] as? String ?? "" }
}
