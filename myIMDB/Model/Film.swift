//
//  Film.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 29.09.23.
//

import UIKit

class Film: BaseModel {
    static let numberOfDetails = 12
    
    @objc var characters: [String]
    {
        get {
            let characters = jsonDict["characters"] as? [String] ?? [String]()
            var charactersIds: [String] = []
            characters.forEach { character in
                let components = character.components(separatedBy: "/")
                
                charactersIds.append(components[components.count - 2])
            }
            
            return charactersIds
        }
    }
    
    @objc var createdAt: String { jsonDict["created"] as? String ?? "" }
    
    @objc var director: String { return jsonDict["director"] as? String ?? "" }
    
    @objc var editedAt: String { return jsonDict["edited"] as? String ?? "" }
    
    @objc var episodeId: Int { return Int(jsonDict["episodeId"] as? String ?? "") ?? 0 }
    
    @objc var openingCrawl: String { return jsonDict["opening_crawl"] as? String ?? "" }
    
    @objc var planets: [String]
    {
        get {
            let planets = jsonDict["planets"] as? [String] ?? [String]()
            var planetsIds: [String] = []
            planets.forEach { planet in
                let components = planet.components(separatedBy: "/")
                
                planetsIds.append(components[components.count - 2])
            }
            
            return planetsIds
        }
    }
    
    @objc var producers: String { return jsonDict["producer"] as? String ?? "" }
    
    @objc var releaseDate: String { return jsonDict["release_date"] as? String ?? "" }
    
    @objc var species: [String]
    {
        get {
            let allSpecies = jsonDict["species"] as? [String] ?? [String]()
            var speciesIds: [String] = []
            allSpecies.forEach { species in
                let components = species.components(separatedBy: "/")
                
                speciesIds.append(components[components.count - 2])
            }
            
            return speciesIds
        }
    }
    
    @objc var starships: [String]
    {
        get {
            let starships = jsonDict["starships"] as? [String] ?? [String]()
            var starshipsIds: [String] = []
            starships.forEach { starship in
                let components = starship.components(separatedBy: "/")
                
                starshipsIds.append(components[components.count - 2])
            }
            
            return starshipsIds
        }
    }
    
    @objc var title: String { return jsonDict["title"] as? String ?? "" }
    
    @objc var url: String { return jsonDict["url"] as? String ?? "" }
    
    @objc var vehicles: [String]
    {
        get {
            let vehicles = jsonDict["vehicles"] as? [String] ?? [String]()
            var vehiclesIds: [String] = []
            vehicles.forEach { vehicle in
                let components = vehicle.components(separatedBy: "/")
                
                vehiclesIds.append(components[components.count - 2])
            }
            
            return vehiclesIds
        }
    }
}
