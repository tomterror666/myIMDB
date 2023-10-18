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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Starship.numberOfDetails - 1    // -1 because character's name is displayed in navigation bar
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let starship else {
            return UITableViewCell(style: .default, reuseIdentifier: "")
        }
        let type = StarshipDetailType(rawValue: indexPath.row)
        
        switch type {
        case .model:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Model:", value: starship.model)
        case .manufacturer:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Manufacturer:", value: starship.manufacturer)
        case .cost_in_credits:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Costs in credits:", value: starship.costInCredits > 0 ? "\(starship.costInCredits)" : "unknown")
        case .length:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Length:", value: "\(starship.length) m")
        case .max_atmosphering_speed:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Max Speed (atmos.):", value: starship.maxAtmospheringSpeed)
        case .crew:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Crew:", value: "\(starship.crew)")
        case .passengers:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Passengers:", value: "\(starship.passengers)")
        case .cargo_capacity:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Cargo capacity:", value: "\(starship.cargoCapacity)")
        case .consumables:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Consumables:", value: starship.consumables)
        case .hyperdrive_rating:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Hyperdrive rating:", value: "\(starship.hyperdriveRating)")
        case .MGLT:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "MGLT:", value: "\(starship.MGLT)")
        case .starship_class:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Class:", value: starship.starshipClass)
        case .pilots:
            return LinkTableViewCell.configuredLinkCell(for: tableView, owner: self, with: "Pilots")
        case .films:
            return LinkTableViewCell.configuredLinkCell(for: tableView, owner: self, with: "Films")
        case .created:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Created at:", value: starship.createdAt)
        case .edited:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Edited at:", value: starship.editedAt)
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
        
        guard let starship else { return }
        
        let type = StarshipDetailType(rawValue: indexPath.row)
        var vc: UIViewController?
        
        switch type {
        case .pilots:
            if starship.pilots.count == 0 {
                Info.show(message: "Pilot list is empty!", of: .info, in: view.bounds.size.width / 2, connect: tableView.cellForRow(at: indexPath)!)
                break
            }
            vc = CharacterListViewController(nibName: "CharacterListViewController", bundle: nil)
            (vc as! CharacterListViewController).characters = starship.pilots
        case .films:
            if starship.films.count == 0 {
                Info.show(message: "Film list is empty!", of: .info, in: view.bounds.size.width / 2, connect: tableView.cellForRow(at: indexPath)!)
                break
            }
            vc = FilmListViewController(nibName: "FilmListViewController", bundle: nil)
            (vc as! FilmListViewController).films = starship.films
        default:
            break
        }
        
        if let vc {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
