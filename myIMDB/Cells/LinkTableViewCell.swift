//
//  LinkTableViewCell.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 01.10.23.
//

import UIKit

class LinkTableViewCell: UITableViewCell {
    static let cellIdentifier = "LinkTableViewCell"
    
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var loadingView: UIActivityIndicatorView?
    
    var linkTitle: String? {
        didSet {
            titleLabel?.text = linkTitle
        }
    }
    
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

    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel?.text = linkTitle
        isLoading = false
    }
    
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
