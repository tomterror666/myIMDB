//
//  String.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 17.10.23.
//

import Foundation
import UIKit

extension String {
    /// Compute height of string when displayed on screen
    ///
    /// - parameter width:  the max. width in which the text should be displayed in Points
    /// - parameter font:   the used font to display the text
    ///
    /// - Returns:  Height of the full text in Points
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
    
        return ceil(boundingBox.height)
    }

    /// Compute width of string when displayed on screen
    ///
    /// - parameter height: the max. height in which the text should be displayed in Points
    /// - parameter font:   the used font to display the text
    ///
    /// - Returns:  Width of the full text in Points
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.width)
    }
    
    /// Convert first letter of text to uppercase
    ///
    /// - Returns: The converted text - e.g.: *"test"* to *"Test"*
    func startsWithUppercase() -> String {
        if let first = self.first {
            return first.uppercased() + self.dropFirst()
        } else {
            return ""
        }
    }
}
