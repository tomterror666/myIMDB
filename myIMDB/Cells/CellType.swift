//
//  CellType.swift
//  myIMDB
//
//  Created by Andre Heß on 19.10.23.
//

import Foundation

enum _cellType: Int {
    case unknown = -1
    case link = 0
    case longText = 1
    case stringValue = 2
    case intValue = 3
    case floatValue = 4
}

class CellType: Equatable, ExpressibleByStringLiteral {
    
    var type: _cellType = .unknown
    
    var propertyName: String = ""
    
    var propertyLabel: String?
    
    var vcClassName: String?
    
    var unitExtension: String?
    
    required init(stringLiteral value: StringLiteralType) {
        let components = value.components(separatedBy: ",")
        
        if components.count >= 3 {
            self.type = _cellType(rawValue: Int(components[0])!)!
            self.propertyName = components[1]
            self.propertyLabel = components[2]
        }
        if components.count >= 4 {
            self.vcClassName = components[3]
        }
        if components.count == 5 {
            self.unitExtension = components[4]
        }
    }
    
    static func == (lhs: CellType, rhs: CellType) -> Bool {
        return lhs.type == rhs.type
    }
    
    
}

/*enum CellType: CellTypeDetail {
    
}*/
