//
//  UIView.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 01.10.23.
//

import Foundation
import UIKit

extension UITableViewCell {
    class func loadNib(withNibName nibName: String, withOwner owner: Any) -> UITableViewCell {
        let nib = UINib(nibName: nibName, bundle: Bundle.main)
        let view = nib.instantiate(withOwner: owner, options: nil).first as! UITableViewCell
        
        return view
    }
}
