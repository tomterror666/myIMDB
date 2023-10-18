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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        planetDetailsTableView?.estimatedRowHeight = 39
        planetDetailsTableView?.rowHeight = UITableView.automaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        title = planet?.name
    }
    


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Planet.numberOfDetails - 1    // -1 because character's name is displayed in navigation bar
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let planet else {
            return UITableViewCell(style: .default, reuseIdentifier: "")
        }
        let type = PlanetDetailType(rawValue: indexPath.row)
        
        switch type {
        case .rotation_period:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Rotation:", value: planet.rotationPeriod > 0 ? "\(planet.rotationPeriod) hours" : "unkn own")
        case .orbital_period:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Orbital:", value: planet.orbitalPeriod > 0 ? "\(planet.orbitalPeriod) days" : "unknown")
        case .diameter:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Diameter:", value: "\(planet.diameter) km")
        case .climate:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Climate:", value: planet.climate)
        case .gravity:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Gravity:", value: planet.gravity)
        case .terrain:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Terrain:", value: planet.terrain)
        case .surface_water:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Water content:", value: "\(planet.hasSurfaceWater) %")
        case .population:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Population:", value: planet.population > 0 ? planet.population.formattedWithSeparator : "unknown")
        case .created:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Created at:", value: planet.createdAt)
        case .edited:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Edited at:", value: planet.editedAt)
        case .residents:
            return LinkTableViewCell.configuredLinkCell(for: tableView, owner: self, with: "Residents:")
        case .films:
            return LinkTableViewCell.configuredLinkCell(for: tableView, owner: self, with: "Films:")
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
        
        guard let planet else { return }
        
        let type = PlanetDetailType(rawValue: indexPath.row)
        var vc: UIViewController?
        
        switch type {
        case .films:
            if planet.films.count == 0 {
                Info.show(message: "Film list is empty!", of: .info, in: view.bounds.size.width / 2, connect: tableView.cellForRow(at: indexPath)!)
                break
            }
            vc = FilmListViewController(nibName: "FilmListViewController", bundle: nil)
            (vc as! FilmListViewController).films = planet.films
        case .residents:
            if planet.residents.count == 0 {
                Info.show(message: "Resident list is empty!", of: .info, in: view.bounds.size.width / 2, connect: tableView.cellForRow(at: indexPath)!)
                break
            }
            vc = CharacterListViewController(nibName: "CharacterListViewController", bundle: nil)
            (vc as! CharacterListViewController).characters = planet.residents
        default:
            break
        }
        
        if let vc {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
