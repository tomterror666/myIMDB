//
//  LongTextTableViewCell.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 01.10.23.
//

import UIKit

/// Cell for displaying a long text in a cell
class LongTextTableViewCell: UITableViewCell {
    /// Cell identifier used for identifiing this cell in table view's cell queue
    static let cellIdentifier = "longTextTableViewCell"
    
    @IBOutlet var longTextLabel: UILabel?       /// LongTextLabel outlet
    
    /// Value displayed on the long text label
    var longText: String? {
        didSet {
            longTextLabel?.text = longText
        }
    }

    /// Overriden func **awakeFromNib**
    override func awakeFromNib() {
        super.awakeFromNib()
        
        longTextLabel?.text = longText
    }
    
    /// Static function to create a configured link cell
    ///
    /// - parameter tableView:  the corresponding table view
    /// - parameter owner:      the corresponding view controller as owner
    /// - parameter longText:   value to be displayed as link in this table view cell
    ///
    /// - Returns:  dequeued and configured table view cell
    static func configuredLongTextCell(for tableView: UITableView, owner: UIViewController, with longText: String) -> LongTextTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LongTextTableViewCell.cellIdentifier) as? LongTextTableViewCell
        
        if cell != nil {
            cell?.longText = longText
            
            return cell!
        }
        
        let newCell = LongTextTableViewCell.loadNib(withNibName: "LongTextTableViewCell", withOwner: owner) as! LongTextTableViewCell
        
        newCell.longText = longText
        newCell.setNeedsDisplay()
        
        return newCell
    }
}
