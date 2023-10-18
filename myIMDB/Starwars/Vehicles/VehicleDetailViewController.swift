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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Vehicle.numberOfDetails - 1    // -1 because character's name is displayed in navigation bar
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let vehicle else {
            return UITableViewCell(style: .default, reuseIdentifier: "")
        }
        let type = VehicleDetailType(rawValue: indexPath.row)
        
        switch type {
        case .model:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Model:", value: vehicle.model)
        case .manufacturer:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Manufacturer:", value: vehicle.manufacturer)
        case .cost_in_credits:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Costs in credits:", value:vehicle.costInCredits > 0 ? "\(vehicle.costInCredits)" : "unknown")
        case .length:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Length:", value: "\(vehicle.length)")
        case .max_atmosphering_speed:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Max Speed (atmos.):", value: "\(vehicle.maxAtmospheringSpeed)")
        case .crew:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Crew:", value: "\(vehicle.crew)")
        case .passengers:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Passengers:", value: "\(vehicle.passengers)")
        case .cargo_capacity:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Cargo capacity:", value: "\(vehicle.cargoCapacity)")
        case .consumables:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Consumables:", value: vehicle.consumables)
        case .vehicle_class:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Vehicle class:", value: vehicle.vehicleClass)
        case .pilots:
            return LinkTableViewCell.configuredLinkCell(for: tableView, owner: self, with: "Pilots")
        case .films:
            return LinkTableViewCell.configuredLinkCell(for: tableView, owner: self, with: "Films")
        case .created:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Created at:", value: vehicle.createdAt)
        case .edited:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Edited at:", value: vehicle.editedAt)
        default:
            return UITableViewCell(style: .default, reuseIdentifier: "")
        }
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if tableView.cellForRow(at: indexPath) is LinkTableViewCell {
            return indexPath
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let vehicle else { return }
        
        let type = VehicleDetailType(rawValue: indexPath.row)
        var vc: UIViewController?
        
        switch type {
        case .pilots:
            if vehicle.pilots.count == 0 {
                Info.show(message: "Pilot list is empty!", of: .info, in: view.bounds.size.width / 2, connect: tableView.cellForRow(at: indexPath)!)
                break
            }
            vc = CharacterListViewController(nibName: "CharacterListViewController", bundle: nil)
            (vc as! CharacterListViewController).characters = vehicle.pilots
        case .films:
            if vehicle.films.count == 0 {
                Info.show(message: "Film list is empty!", of: .info, in: view.bounds.size.width / 2, connect: tableView.cellForRow(at: indexPath)!)
                break
            }
            vc = FilmListViewController(nibName: "FilmListViewController", bundle: nil)
            (vc as! FilmListViewController).films = vehicle.films
        default:
            break
        }
        
        if let vc {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
