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

class CellType: NSObject {
    
    var type: _cellType = .unknown
    
    var propertyName: String
    
    var propertyLabel: String
    
    var vcClassName: String?
    
    var unitExtension: String?
    
    init(type: _cellType, propertyName: String, propertyLabel: String, vcClassName: String? = nil, unitExtension: String? = nil) {
        self.type = type
        self.propertyName = propertyName
        self.propertyLabel = propertyLabel
        self.vcClassName = vcClassName
        self.unitExtension = unitExtension
    }
    
}
