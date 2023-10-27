//
//  CharacterDetailType.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 05.10.23.
//

import Foundation

let CharacterDetailType: Array<CellType> = [
    CellType(type: .intValue, propertyName: "height", propertyLabel: "Height:", unitExtension: "cm"),
    CellType(type: .intValue, propertyName: "mass", propertyLabel: "Mass:", unitExtension: "Kg"),
    CellType(type: .stringValue, propertyName: "hairColor", propertyLabel: "Hair Color:"),
    CellType(type: .stringValue, propertyName: "skinColor", propertyLabel: "Skin Color:"),
    CellType(type: .stringValue, propertyName: "eyeColor", propertyLabel: "Eye Color:"),
    CellType(type: .stringValue, propertyName: "birthYear", propertyLabel: "Birth Year"),
    CellType(type: .stringValue, propertyName: "createdAt", propertyLabel: "Created at:"),
    CellType(type: .stringValue, propertyName: "editedAt", propertyLabel: "Edited at:"),
    CellType(type: .stringValue, propertyName: "gender", propertyLabel: "Gender;"),
    CellType(type: .link, propertyName: "homeworld", propertyLabel: "Homeworld", vcClassName: "PlanetListViewController"),
    CellType(type: .link, propertyName: "films", propertyLabel: "Films", vcClassName: "FilmListViewController"),
    CellType(type: .link, propertyName: "species", propertyLabel: "Species", vcClassName: "SpeciesListViewController"),
    CellType(type: .link, propertyName: "vehicles", propertyLabel: "Vehicles", vcClassName: "VehicleListViewController"),
    CellType(type: .link, propertyName: "starships", propertyLabel: "Starships", vcClassName: "StarshipListViewController")
]
