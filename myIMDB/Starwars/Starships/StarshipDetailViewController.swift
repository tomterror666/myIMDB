//
//  StarshipDetailViewController.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 16.10.23.
//

import UIKit

class StarshipDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var starshipDetailTableView: UITableView?
    
    var starship: Starship? {
        didSet {
            self.title = starship?.name
            self.starshipDetailTableView?.reloadData()
        }
    }
    
    var cellProvider: CellProvider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if cellProvider == nil, let starshipDetailTableView {
            cellProvider = CellProvider(tableView: starshipDetailTableView, owner: self)
        }
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Starship.numberOfDetails - 1    // -1 because character's name is displayed in navigation bar
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let starship, let cellProvider else {
            return UITableViewCell(style: .default, reuseIdentifier: "")
        }
        
        return cellProvider.cell(forModel: starship, atLine: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if tableView.cellForRow(at: indexPath) is LinkTableViewCell {
            return indexPath
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let starship, let cellProvider, let vc = cellProvider.vcToOpen(forModel: starship, atLine: indexPath.row) else { return }
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
