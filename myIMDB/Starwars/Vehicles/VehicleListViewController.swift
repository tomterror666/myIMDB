//
//  VehicleListViewController.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 16.10.23.
//

import UIKit

class VehicleListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var vehicleListTableView: UITableView?

    let provider: VehicleProvider = VehicleProvider.sharedObject
    
    var vehicles: [String] = [] {
        didSet {
            vehicleListTableView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Vehicles"
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehicles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row < vehicles.count, indexPath.row > -1 else {
            return UITableViewCell(style: .default, reuseIdentifier: "")
        }
        
        let vehicle = vehicles[indexPath.row]
        let cell = LinkTableViewCell.configuredLinkCell(for: tableView, owner: self, with: vehicle)
        
        cell.isLoading = true
        
        provider.fetchVehicle(withId: vehicle) { fullVehicle, error in
            if let error {
                print("Error: \(error)")
                
                return
            }
            
            cell.linkTitle = fullVehicle?.name
            cell.isLoading = false
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vehicle = vehicles[indexPath.row]
        
        provider.fetchVehicle(withId: vehicle) { fullVehicle, error in
            if let error {
                print("Error: \(error)")
                
                return
            }
            
            let vc = VehicleDetailViewController(nibName: "VehicleDetailViewController", bundle: nil)
            
            vc.vehicle = fullVehicle
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if tableView.cellForRow(at: indexPath) is LinkTableViewCell {
            return indexPath
        }
        
        return nil
    }
}
