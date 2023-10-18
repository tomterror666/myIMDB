//
//  File.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 29.09.23.
//

import Foundation

class MenuEntry {
    var title: String
    var controllerClassName: String
    
    init(title: String, controllerClassName: String) {
        self.title = title
        self.controllerClassName = controllerClassName
    }
}
