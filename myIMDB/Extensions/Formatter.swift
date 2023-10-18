//
//  Formatter.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 12.10.23.
//

import Foundation

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        
        formatter.groupingSeparator = Locale.current.groupingSeparator
        formatter.numberStyle = .decimal
        
        return formatter
    }()
}
