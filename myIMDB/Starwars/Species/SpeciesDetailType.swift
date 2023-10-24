//
//  SpeciesDetailType.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 16.10.23.
//

import Foundation

/*enum SpeciesDetailType: Int {
    case unknown = -1
    case classification = 0
    case designation = 1
    case averageHeight = 2
    case skinColors = 3
    case hairColors = 4
    case eyeColors = 5
    case averageLifespan = 6
    case language = 7
    case created = 8
    case edited = 9
    case homeworld = 10
    case people = 11
    case films = 12
    case name = 13
}

class SpeciesDetailCellType: NSObject {
    var type: SpeciesDetailType = .unknown
    var cellClassName: String = ""
}*/

let SpeciesDetailType = [
    CellType(stringLiteral: "2,classification,Classification:"),
    CellType(stringLiteral: "2,designation,Designation:"),
    CellType(stringLiteral: "3,averageHeight,Avg. Height:,,cm"),
    CellType(stringLiteral: "2,skinColors,Skin Colors:"),
    CellType(stringLiteral: "2,hairColors,Hair Colors:"),
    CellType(stringLiteral: "2,eyeColors,Eye colors:"),
    CellType(stringLiteral: "3,averageLifespan,Avg. Lifespan:,,years"),
    CellType(stringLiteral: "2,language,Language:"),
    CellType(stringLiteral: "2,createdAt,Created at:"),
    CellType(stringLiteral: "2,editedAt,Edited at:"),
    CellType(stringLiteral: "0,homeworld,Homeworld,PlanetListViewController"),
    CellType(stringLiteral: "0,people,People,CharacterListViewController"),
    CellType(stringLiteral: "0,films,Films,FilmListViewController"),
]
