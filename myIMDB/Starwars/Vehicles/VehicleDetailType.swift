//
//  VehicleDetailType.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 16.10.23.
//

import Foundation

/*enum VehicleDetailType: Int {
    case unknown = -1
    case model = 0
    case manufacturer = 1
    case cost_in_credits = 2
    case length = 3
    case max_atmosphering_speed = 4
    case crew = 5
    case passengers = 6
    case cargo_capacity = 7
    case consumables = 8
    case vehicle_class = 9
    case created = 10
    case edited = 11
    case pilots = 12
    case films = 13
    case name = 14
}*/

let VehicleDetailType = [
    CellType(stringLiteral: "2,model,Model:"),
    CellType(stringLiteral: "2,manufacturer,Manufacturer:"),
    CellType(stringLiteral: "3,costInCredits,Costs in Credits;"),
    CellType(stringLiteral: "4,length,Length:,,m"),
    CellType(stringLiteral: "3,maxAtmospheringSpeed,max atmos. Speed:,,m/s"),
    CellType(stringLiteral: "3,crew,Crew:"),
    CellType(stringLiteral: "3,passengers,Passengers:"),
    CellType(stringLiteral: "3,cargoCapacity,Cargo Capacity:"),
    CellType(stringLiteral: "2,consumables,Consumables"),
    CellType(stringLiteral: "2,vehicleClass,Vehicle Class:"),
    CellType(stringLiteral: "2,createdAt,Created at:"),
    CellType(stringLiteral: "2,editedAt,Edited at:"),
    CellType(stringLiteral: "0,pilots,Pilots,SpeciesListViewController"),
    CellType(stringLiteral: "0,films,Films,FilmListViewController"),
]
