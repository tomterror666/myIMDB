//
//  FilmDetailType.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 01.10.23.
//

import Foundation

/*enum FilmDetailType: Int {
    case unknown = -1
    case openingCrawl = 0
    case characters = 1
    case planets = 2
    case species = 3
    case spaceships = 4
    case vehicles = 5
    case director = 6
    case producers = 7
    case releaseDate = 8
    case createdAt = 9
    case editedAt = 10
    case title = 11
}

class FilmDetailCellType: NSObject {
    var type: FilmDetailType = .unknown
    var cellClassName: String = ""
}*/

let FilmDetailType: Array<CellType> = [
    CellType(stringLiteral: "1,openingCrawl,"),
    CellType(stringLiteral: "0,characters,Characters,CharacterListViewController"),
    CellType(stringLiteral: "0,planets,Planets,PlanetListViewController"),
    CellType(stringLiteral: "0,species,Species,SpeciesListViewController"),
    CellType(stringLiteral: "0,starships,Starships,StarshipListViewController"),
    CellType(stringLiteral: "0,vehicles,Vehicles,VehicleListViewController"),
    CellType(stringLiteral: "2,director,Director:"),
    CellType(stringLiteral: "2,producers,Producers:"),
    CellType(stringLiteral: "2,releaseDate,Release Date:"),
    CellType(stringLiteral: "2,createdAt,Created at:"),
    CellType(stringLiteral: "2,editedAt,Edited at:")
]
