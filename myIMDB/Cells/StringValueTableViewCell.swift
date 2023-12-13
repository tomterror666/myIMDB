//
//  StringValueTableViewCell.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 01.10.23.
//

import UIKit

/// Cell for displaying a string value and its name in a cell
class StringValueTableViewCell: UITableViewCell {
    /// Cell identifier used for identifiing this cell in table view's cell queue
    static let cellIdentifier = "stringValueTableViewCell"
    
    @IBOutlet var titleLabel: UILabel?      /// TitleLabel outlet displaying the name
    @IBOutlet var valueLebal: UILabel?      /// ValueLabel outlet displaying the value
    
    /// Tile of this cell - displayed as left text
    var title: String? {
        didSet {
            titleLabel?.text = title
        }
    }
    
    /// Value of this cell - displayed as right text
    var value: String? {
        didSet {
            valueLebal?.text = value
        }
    }
    
    /// Overriden func **awakeFromNib**
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel?.text = title
        valueLebal?.text = value
    }

    /// Static function to create a configured link cell
    ///
    /// - parameter tableView:  the corresponding table view
    /// - parameter owner:      the corresponding view controller as owner
    /// - parameter title:      title to be displayed in this table view cell
    /// - parameter value:      value to be displayed in this table view cell
    ///
    /// - Returns:  dequeued and configured table view cell
    static func configuredStringValueCell(for tableView: UITableView, owner: UIViewController, with title: String, value: String) -> StringValueTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StringValueTableViewCell.cellIdentifier) as? StringValueTableViewCell
        
        if cell != nil {
            cell?.title = title
            cell?.value = value
            
            return cell!
        }
        
        let newCell = StringValueTableViewCell.loadNib(withNibName: "StringValueTableViewCell", withOwner: owner) as! StringValueTableViewCell
        
        newCell.title = title
        newCell.value = value
        
        return newCell
    }
    
}
