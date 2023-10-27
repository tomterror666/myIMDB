//
//  File.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 12.10.23.
//

import Foundation

let PlanetDetailType = [
    CellType(type: .intValue, propertyName: "rotationPeriod", propertyLabel: "Rotation Period:", unitExtension: "hours"),
    CellType(type: .intValue, propertyName: "orbitalPeriod", propertyLabel: "Orbital Period:", unitExtension: "days"),
    CellType(type: .intValue, propertyName: "diameter", propertyLabel: "Diameter:", unitExtension: "km"),
    CellType(type: .stringValue, propertyName: "climate", propertyLabel: "Climate:"),
    CellType(type: .stringValue, propertyName: "gravity", propertyLabel: "Gravity:"),
    CellType(type: .stringValue, propertyName: "terrain", propertyLabel: "Terrain:"),
    CellType(type: .floatValue, propertyName: "hasSurfaceWater", propertyLabel: "Water Coverage:", unitExtension: "%"),
    CellType(type: .intValue, propertyName: "population", propertyLabel: "Population:"),
    CellType(type: .stringValue, propertyName: "createdAt", propertyLabel: "Created at:"),
    CellType(type: .stringValue, propertyName: "editedAt", propertyLabel: "Edited at:"),
    CellType(type: .link, propertyName: "residents", propertyLabel: "Residents", vcClassName: "CharacterListViewController"),
    CellType(type: .link, propertyName: "films", propertyLabel: "Films", vcClassName: "FilmListViewController")
];
