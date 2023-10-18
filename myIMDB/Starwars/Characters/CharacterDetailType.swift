//
//  CharacterDetailType.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 05.10.23.
//

import Foundation

enum CharacterDetailType: Int {
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
}
