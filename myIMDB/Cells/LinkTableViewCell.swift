//
//  LinkTableViewCell.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 01.10.23.
//

import UIKit

/// Cell for displaying a link
class LinkTableViewCell: UITableViewCell {
    /// Cell identifier used for identifiing this cell in table view's cell queue
    static let cellIdentifier = "LinkTableViewCell"
    
    @IBOutlet var titleLabel: UILabel?                      /// Title label outlet
    @IBOutlet var loadingView: UIActivityIndicatorView?     /// Loading view outlet
    
    /// Value displayed on the link label
    var linkTitle: String? {
        didSet {
            titleLabel?.text = linkTitle
        }
    }
    
    /// Loading state of this cell - while loading an acitivity indicator is displayed
    var isLoading: Bool = false {
        didSet {
            if isLoading {
                loadingView?.startAnimating()
                loadingView?.isHidden = false
                titleLabel?.isHidden = true
            } else {
                loadingView?.stopAnimating()
                loadingView?.isHidden = true
                titleLabel?.isHidden = false
            }
        }
    }

    /// Overriden func **awakeFromNib**
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel?.text = linkTitle
        isLoading = false
    }
    
    /// Static function to create a configured link cell
    ///
    /// - parameter tableView:  the corresponding table view
    /// - parameter owner:      the corresponding view controller as owner
    /// - parameter title:      value to be displayed as link in this table view cell
    ///
    /// - Returns:  dequeued and configured table view cell
    static func configuredLinkCell(for tableView: UITableView, owner: UIViewController, with title: String) -> LinkTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LinkTableViewCell.cellIdentifier) as? LinkTableViewCell
        
        if cell != nil {
            cell?.linkTitle = title
            
            return cell!
        }
        
        let newCell = LinkTableViewCell.loadNib(withNibName: "LinkTableViewCell", withOwner: owner) as! LinkTableViewCell
        
        newCell.linkTitle = title
        
        return newCell
    }
}
