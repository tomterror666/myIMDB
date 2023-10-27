//
//  FilmDetailType.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 01.10.23.
//

import Foundation

let FilmDetailType: Array<CellType> = [
    CellType(type: .longText, propertyName: "openingCrawl", propertyLabel: ""),
    CellType(type: .link, propertyName: "characters", propertyLabel: "Characters", vcClassName: "CharacterListViewController"),
    CellType(type: .link, propertyName: "planets", propertyLabel: "Planets", vcClassName: "PlanetListViewController"),
    CellType(type: .link, propertyName: "species", propertyLabel: "Species", vcClassName: "SpeciesListViewController"),
    CellType(type: .link, propertyName: "starships", propertyLabel: "Starships", vcClassName: "StarshipListViewController"),
    CellType(type: .link, propertyName: "vehicles", propertyLabel: "Vehicles", vcClassName: "VehicleListViewController"),
    CellType(type: .stringValue, propertyName: "director", propertyLabel: "Director:"),
    CellType(type: .stringValue, propertyName: "producers", propertyLabel: "Producers:"),
    CellType(type: .stringValue, propertyName: "releaseDate", propertyLabel: "Release Date:"),
    CellType(type: .stringValue, propertyName: "createdAt", propertyLabel: "Created at:"),
    CellType(type: .stringValue, propertyName: "editedAt", propertyLabel: "Edited at:"),
]
