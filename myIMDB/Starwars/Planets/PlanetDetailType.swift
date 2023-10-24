//
//  File.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 12.10.23.
//

import Foundation

/*enum PlanetDetailType: Int {
    case unknown = -1
    case rotation_period = 0
    case orbital_period = 1
    case diameter = 2
    case climate = 3
    case gravity = 4
    case terrain = 5
    case surface_water = 6
    case population = 7
    case created = 8
    case edited = 9
    case residents = 10
    case films = 11
    case name = 12
}

class PlanetDetailCellType: NSObject {
    var type: PlanetDetailType = .unknown
    var cellClassName: String = ""
}*/

let PlanetDetailType = [
    CellType(stringLiteral: "3,rotationPeriod,Rotation Period:,,hours"),
    CellType(stringLiteral: "3,orbitalPeriod,Orbital Period:,,days"),
    CellType(stringLiteral: "3,diameter,Diameter:,,km"),
    CellType(stringLiteral: "2,climate,Climate:"),
    CellType(stringLiteral: "2,gravity,Gravity:"),
    CellType(stringLiteral: "2,terrain,Terrain:"),
    CellType(stringLiteral: "4,hasSurfaceWater,Water Coverage:,,%"),
    CellType(stringLiteral: "3,population,Population:"),
    CellType(stringLiteral: "2,createdAt,Created at:"),
    CellType(stringLiteral: "2,editedAt,Edited at:"),
    CellType(stringLiteral: "0,residents,Residents,CharacterListViewController"),
    CellType(stringLiteral: "0,films,Films,FilmListViewController"),
];
