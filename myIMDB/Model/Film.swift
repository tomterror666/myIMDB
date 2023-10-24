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
            let characters = (jsonDict["characters"] ?? []) as! [String]
            var charactersIds: [String] = []
            characters.forEach { character in
                let components = character.components(separatedBy: "/")
                
                charactersIds.append(components[components.count - 2])
            }
            
            return charactersIds
        }
    }
    
    @objc var createdAt: String
    {
        get {
            return (jsonDict["created"] ?? "") as! String
        }
    }
    
    @objc var director: String
    {
        get {
            return (jsonDict["director"] ?? "") as! String
        }
    }
    
    @objc var editedAt: String
    {
        get {
            return (jsonDict["edited"] ?? "") as! String
        }
    }
    
    @objc var episodeId: Int
    {
        get {
            return (jsonDict["episodeId"] ?? 0) as! Int
        }
    }
    
    @objc var openingCrawl: String
    {
        get {
            return (jsonDict["opening_crawl"] ?? "") as! String
        }
    }
    
    @objc var planets: [String]
    {
        get {
            let planets = (jsonDict["planets"] ?? []) as! [String]
            var planetsIds: [String] = []
            planets.forEach { planet in
                let components = planet.components(separatedBy: "/")
                
                planetsIds.append(components[components.count - 2])
            }
            
            return planetsIds
        }
    }
    
    @objc var producers: String
    {
        get {
            return (jsonDict["producer"] ?? "") as! String
        }
    }
    
    @objc var releaseDate: String
    {
        get {
            return (jsonDict["release_date"] ?? "") as! String
        }
    }
    
    @objc var species: [String]
    {
        get {
            let allSpecies = (jsonDict["species"] ?? []) as! [String]
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
            let starships = (jsonDict["starships"] ?? []) as! [String]
            var starshipsIds: [String] = []
            starships.forEach { starship in
                let components = starship.components(separatedBy: "/")
                
                starshipsIds.append(components[components.count - 2])
            }
            
            return starshipsIds
        }
    }
    
    @objc var title: String
    {
        get {
            return (jsonDict["title"] ?? "") as! String
        }
    }
    
    @objc var url: URL
    {
        get {
            return URL(string: (jsonDict["url"] ?? "") as! String ) ?? URL(string: "https://www.google.de")!
        }
    }
    
    @objc var vehicles: [String]
    {
        get {
            let vehicles = (jsonDict["vehicles"] ?? []) as! [String]
            var vehiclesIds: [String] = []
            vehicles.forEach { vehicle in
                let components = vehicle.components(separatedBy: "/")
                
                vehiclesIds.append(components[components.count - 2])
            }
            
            return vehiclesIds
        }
    }
}
