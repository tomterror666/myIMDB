//
//  Int.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 12.10.23.
//

import Foundation

extension Int {
    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
}
