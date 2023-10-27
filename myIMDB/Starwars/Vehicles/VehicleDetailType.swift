//
//  VehicleDetailType.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 16.10.23.
//

import Foundation

let VehicleDetailType = [
    CellType(type: .stringValue, propertyName: "model", propertyLabel: "Model"),
    CellType(type: .stringValue, propertyName: "manufacturer", propertyLabel: "Manufacturer"),
    CellType(type: .intValue, propertyName: "costInCredits", propertyLabel: "Costs:", unitExtension: "Credits"),
    CellType(type: .floatValue, propertyName: "length", propertyLabel: "Length:", unitExtension: "m"),
    CellType(type: .intValue, propertyName: "maxAtmospheringSpeed", propertyLabel: "max atmos. Speed:", unitExtension: "km/h"),
    CellType(type: .intValue, propertyName: "crew", propertyLabel: "Crew:"),
    CellType(type: .intValue, propertyName: "passengers", propertyLabel: "Passengers:"),
    CellType(type: .intValue, propertyName: "cargoCapacity", propertyLabel: "Cargo Capacity:", unitExtension: "kg"),
    CellType(type: .stringValue, propertyName: "consumables", propertyLabel: "Consumables:"),
    CellType(type: .stringValue, propertyName: "vehicleClass", propertyLabel: "Vehicle Class:"),
    CellType(type: .stringValue, propertyName: "createdAt", propertyLabel: "Created at:"),
    CellType(type: .stringValue, propertyName: "editedAt", propertyLabel: "Edited at:"),
    CellType(type: .link, propertyName: "pilots", propertyLabel: "Pilots", vcClassName: "CharacterListViewController"),
    CellType(type: .link, propertyName: "films", propertyLabel: "Films", vcClassName: "FilmListViewController"),
]
