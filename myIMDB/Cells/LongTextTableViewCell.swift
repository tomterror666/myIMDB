//
//  LongTextTableViewCell.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 01.10.23.
//

import UIKit

class LongTextTableViewCell: UITableViewCell {
    static let cellIdentifier = "longTextTableViewCell"
    
    @IBOutlet var longTextLabel: UILabel?
    
    var longText: String? {
        didSet {
            longTextLabel?.text = longText
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        longTextLabel?.text = longText
    }
    
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
