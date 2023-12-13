//
//  PlanetDetailsViewController.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 12.10.23.
//

import UIKit

class PlanetDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var planetDetailsTableView: UITableView?

    var planet: Planet? {
        didSet {
            self.title = planet?.name
            self.planetDetailsTableView?.reloadData()
        }
    }
    
    var cellProvider: CellProvider?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        planetDetailsTableView?.estimatedRowHeight = 39
        planetDetailsTableView?.rowHeight = UITableView.automaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        title = planet?.name
        
        if cellProvider == nil, let planetDetailsTableView = planetDetailsTableView {
            cellProvider = CellProvider(tableView: planetDetailsTableView, owner: self, cellType: PlanetDetailType)
        }
    }
    


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlanetDetailType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let planet = planet, let cellProvider = cellProvider else {
            return UITableViewCell(style: .default, reuseIdentifier: "")
        }
        
        return cellProvider.cell(forModel: planet, atLine: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if tableView.cellForRow(at: indexPath) is LinkTableViewCell {
            return indexPath
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let planet = planet, let cellProvider = cellProvider, let vc = cellProvider.vcToOpen(forModel: planet, atLine: indexPath.row) else { return }
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
