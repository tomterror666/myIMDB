//
//  StringValueTableViewCell.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 01.10.23.
//

import UIKit

class StringValueTableViewCell: UITableViewCell {
    static let cellIdentifier = "stringValueTableViewCell"
    
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var detailLebal: UILabel?
    
    var title: String? {
        didSet {
            titleLabel?.text = title
        }
    }
    
    var detail: String? {
        didSet {
            detailLebal?.text = detail
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel?.text = title
        detailLebal?.text = detail
    }

    static func configuredStringValueCell(for tableView: UITableView, owner: UIViewController, with title: String, value: String) -> StringValueTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StringValueTableViewCell.cellIdentifier) as? StringValueTableViewCell
        
        if cell != nil {
            cell?.title = title
            cell?.detail = value
            
            return cell!
        }
        
        let newCell = StringValueTableViewCell.loadNib(withNibName: "StringValueTableViewCell", withOwner: owner) as! StringValueTableViewCell
        
        newCell.title = title
        newCell.detail = value
        
        return newCell
    }
    
}
