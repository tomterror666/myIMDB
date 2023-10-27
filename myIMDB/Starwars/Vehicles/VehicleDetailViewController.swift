//
//  VehicleDetailViewController.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 16.10.23.
//

import UIKit

class VehicleDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var vehicleDetailTableView: UITableView?

    var vehicle: Vehicle? {
        didSet {
            self.title = vehicle?.name
            self.vehicleDetailTableView?.reloadData()
        }
    }
    
    var cellProvider: CellProvider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if cellProvider == nil, let vehicleDetailTableView {
            cellProvider = CellProvider(tableView: vehicleDetailTableView, owner: self, cellType: VehicleDetailType)
        }
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Vehicle.numberOfDetails - 1    // -1 because character's name is displayed in navigation bar
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let vehicle, let cellProvider else {
            return UITableViewCell(style: .default, reuseIdentifier: "")
        }
        
        return cellProvider.cell(forModel: vehicle, atLine: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if tableView.cellForRow(at: indexPath) is LinkTableViewCell {
            return indexPath
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let vehicle, let cellProvider, let vc = cellProvider.vcToOpen(forModel: vehicle, atLine: indexPath.row) else { return }
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
