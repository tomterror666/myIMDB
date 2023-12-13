//
//  Int.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 12.10.23.
//

import Foundation

extension Int {
    /// Converting an integer value to ``String`` by adding a localized grouping separator
    var withSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
}
