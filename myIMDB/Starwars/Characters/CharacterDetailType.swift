//
//  CharacterDetailType.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 05.10.23.
//

import Foundation

/*enum CharacterDetailType: Int {
    case unknown = -1
    case height = 0
    case mass = 1
    case hairColor = 2
    case skinColor = 3
    case eyeColor = 4
    case birthYear = 5
    case createdAt = 6
    case editedAt = 7
    case gender = 8
    case homeWorld = 9
    case films = 10
    case species = 11
    case vehicles = 12
    case starships = 13
    case name = 14
}

class CharacterDetailCellType: NSObject {
    var type: CharacterDetailType = .unknown
    var cellClassName: String = ""
}*/

let CharacterDetailType: Array<CellType> = [
    CellType(stringLiteral: "3,height,Height:,,cm"),
    CellType(stringLiteral: "3,mass,Mass:,,kg"),
    CellType(stringLiteral: "2,hairColor,Hair Color:"),
    CellType(stringLiteral: "2,skinColor,Skin Color:"),
    CellType(stringLiteral: "2,eyeColor,Eye Color:"),
    CellType(stringLiteral: "2,birthYear,Birth Year:"),
    CellType(stringLiteral: "2,createdAt,Created at:"),
    CellType(stringLiteral: "2,editedAt,Edited at:"),
    CellType(stringLiteral: "2,gender,Gender:"),
    CellType(stringLiteral: "0,homeworld,Homeworld,PlanetListViewController"),
    CellType(stringLiteral: "0,films,Films,FilmListViewController"),
    CellType(stringLiteral: "0,species,Species,SpeciesListViewController"),
    CellType(stringLiteral: "0,vehicles,Vehicles,VehicleListViewController"),
    CellType(stringLiteral: "0,starships,Starships,StarshipListViewController"),
]
