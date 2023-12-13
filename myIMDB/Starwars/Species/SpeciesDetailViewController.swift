//
//  SpeciesDetailsViewController.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 16.10.23.
//

import UIKit

class SpeciesDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var speciesDetailsTableView: UITableView?

    var species: Species? {
        didSet {
            self.title = species?.name
            self.speciesDetailsTableView?.reloadData()
        }
    }
    
    var cellProvider: CellProvider?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if cellProvider == nil, let speciesDetailsTableView = speciesDetailsTableView {
            cellProvider = CellProvider(tableView: speciesDetailsTableView, owner: self, cellType: SpeciesDetailType)
        }
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SpeciesDetailType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let species = species, let cellProvider = cellProvider else {
            return UITableViewCell(style: .default, reuseIdentifier: "")
        }
        
        return cellProvider.cell(forModel: species, atLine: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if tableView.cellForRow(at: indexPath) is LinkTableViewCell {
            return indexPath
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let species = species, let cellProvider = cellProvider, let vc = cellProvider.vcToOpen(forModel: species, atLine: indexPath.row) else { return }
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
