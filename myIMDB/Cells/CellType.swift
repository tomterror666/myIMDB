//
//  CellType.swift
//  myIMDB
//
//  Created by Andre Heß on 19.10.23.
//

import Foundation

/// Enum definining the type of cell
enum _cellType: Int {
    case unknown = -1       /// default, unknow - nothing special happend there
    case link = 0           /// this cell represents a link to a next following vc on navigation stack
    case longText = 1       /// this cell contains a long text only so that its height is flexible depending of text length
    case stringValue = 2    /// this cell contains a name and a string value (incl. extension)
    case intValue = 3       /// this cell contains a name and an integer value (incl. extension)
    case floatValue = 4     /// this cell contains a name and a float value (incl. extension)
}

/// Class for defining a cell type and a way to get its content
class CellType: NSObject {
    /// Cell type
    var type: _cellType = .unknown
    
    /// Name of the property for the value of the cell
    var propertyName: String
    
    /// Label to be displayed as name part of the cell
    var propertyLabel: String
    
    /// Name of the class of VC which should be opened on tap
    var vcClassName: String?
    
    /// Name of the extension
    var unitExtension: String?
    
    /// Constructor
    ///
    /// - parameter type:           Cell type
    /// - parameter propertyName:   Name of the property for the value of the cell
    /// - parameter propertyLabel:  Label to be displayed as name part of the cell
    /// - parameter vcClassName:    Name of the class of VC which should be opened on tap
    /// - parameter unitExtension:  Name of the extension
    init(type: _cellType, propertyName: String, propertyLabel: String, vcClassName: String? = nil, unitExtension: String? = nil) {
        self.type = type
        self.propertyName = propertyName
        self.propertyLabel = propertyLabel
        self.vcClassName = vcClassName
        self.unitExtension = unitExtension
    }
    
}
