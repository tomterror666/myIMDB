//
//  SpeciesDetailType.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 16.10.23.
//

import Foundation

let SpeciesDetailType = [
    CellType(type: .stringValue, propertyName: "classification", propertyLabel: "Classification"),
    CellType(type: .stringValue, propertyName: "designation", propertyLabel: "Designation:"),
    CellType(type: .intValue, propertyName: "averageHeight", propertyLabel: "Avg. Height:", unitExtension: "cm"),
    CellType(type: .stringValue, propertyName: "skinColors", propertyLabel: "Skin colors:"),
    CellType(type: .stringValue, propertyName: "hairColors", propertyLabel: "Hair colors:"),
    CellType(type: .stringValue, propertyName: "eyeColors", propertyLabel: "Eye colors:"),
    CellType(type: .intValue, propertyName: "averageLifespan", propertyLabel: "Avg. Lifespan:", unitExtension: "years"),
    CellType(type: .stringValue, propertyName: "language", propertyLabel: "Language:"),
    CellType(type: .stringValue, propertyName: "createdAt", propertyLabel: "Created at:"),
    CellType(type: .stringValue, propertyName: "editedAt", propertyLabel: "Edited at:"),
    CellType(type: .link, propertyName: "homeworld", propertyLabel: "Homeworld", vcClassName: "PlantListViewController"),
    CellType(type: .link, propertyName: "people", propertyLabel: "People", vcClassName: "CharacterListViewController"),
    CellType(type: .link, propertyName: "films", propertyLabel: "Films", vcClassName: "FilmListViewController")
]
