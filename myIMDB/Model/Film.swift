//
//  Film.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 29.09.23.
//

import UIKit

/// Class for a film
class Film: BaseModel {
    /// List of characters whose are a member of this film as array of ``Character`` id
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
    
    /// Date this entry in **SWAPI** was created
    @objc var createdAt: String { jsonDict["created"] as? String ?? "" }
    
    /// Name of director of this film
    @objc var director: String { return jsonDict["director"] as? String ?? "" }
    
    /// Date this entry in **SWAPI** was edited the last time
    @objc var editedAt: String { return jsonDict["edited"] as? String ?? "" }
    
    /// Number of the episode of this film
    @objc var episodeId: Int { return Int(jsonDict["episodeId"] as? String ?? "") ?? 0 }
    
    /// The opening story of this film
    @objc var openingCrawl: String { return jsonDict["opening_crawl"] as? String ?? "" }
    
    /// List of planets where some action takes place in this film as an array of ``Planet`` id
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
    
    /// List of producer names separated by comma
    @objc var producers: String { return jsonDict["producer"] as? String ?? "" }
    
    /// Data this film was produced
    @objc var releaseDate: String { return jsonDict["release_date"] as? String ?? "" }
    
    /// List of species having action in this film as an array of ``Species`` id
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
    
    /// List of spaceships involved in this film as an array o ``Starship`` id
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
    
    /// Title of this film
    @objc var title: String { return jsonDict["title"] as? String ?? "" }
    
    /// Url to this film entry in **SWAPI** as string
    @objc var url: String { return jsonDict["url"] as? String ?? "" }
    
    /// List of vehicles involved in this film as an array of ``Vehicle`` id
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
