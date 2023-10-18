//
//  File.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 12.10.23.
//

import Foundation

enum PlanetDetailType: Int {
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
}
