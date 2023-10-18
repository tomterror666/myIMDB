//
//  SpeciesDetailType.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 16.10.23.
//

import Foundation

enum SpeciesDetailType: Int {
    case unknown = -1
    case classification = 0
    case designation = 1
    case averageHeight = 2
    case skinColors = 3
    case hairColors = 4
    case eyeVolors = 5
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
}
