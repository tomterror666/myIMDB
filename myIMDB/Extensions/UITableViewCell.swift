//
//  UIView.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 01.10.23.
//

import Foundation
import UIKit

extension UITableViewCell {
    /// Loading a table view cell by nib file
    ///
    /// - parameter nibName:    Name of nib file to load
    /// - parameter owner:      Owner of the instantiated cell object
    ///
    /// - Returns:  Newly created table view cell ready for configuration and display
    class func loadNib(withNibName nibName: String, withOwner owner: Any) -> UITableViewCell {
        let nib = UINib(nibName: nibName, bundle: Bundle.main)
        let view = nib.instantiate(withOwner: owner, options: nil).first as! UITableViewCell
        
        return view
    }
}
