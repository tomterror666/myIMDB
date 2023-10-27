//
//  StarshipDetailType.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 16.10.23.
//

import Foundation

/*enum StarshipDetailType: Int {
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
    case hyperdrive_rating = 9
    case MGLT = 10
    case starship_class = 11
    case created = 12
    case edited = 13
    case pilots = 14
    case films = 15
    case name = 16
}*/

let StarshipDetailType = [
    CellType(stringLiteral: "2,model,Model:"),
    CellType(stringLiteral: "2,manufacturer,Manufacturer:"),
    CellType(stringLiteral: "3,costInCredits,Costs in Credits:"),
    CellType(stringLiteral: "4,length,Length:,,m"),
    CellType(stringLiteral: "2,maxAtmospheringSpeed,max atmos. Speed:,,m/s"),
    CellType(stringLiteral: "3,crew,Crew:"),
    CellType(stringLiteral: "3,passengers,Passengers:"),
    CellType(stringLiteral: "3,cargoCapacity,Cargo Capacity:"),
    CellType(stringLiteral: "2,consumables,Consumables:"),
    CellType(stringLiteral: "4,hyperdriveRating,Hyperdrive Rating:"),
    CellType(stringLiteral: "3,MGLT,MGLT:"),
    CellType(stringLiteral: "2,starshipClass,Starship Class:"),
    CellType(stringLiteral: "2,createdAt,Created at:"),
    CellType(stringLiteral: "2,editedAt,Edited at:"),
    CellType(stringLiteral: "0,pilots,Pilots,CharacterListViewController"),
    CellType(stringLiteral: "0,films,Fims,FilmListViewController"),
]
