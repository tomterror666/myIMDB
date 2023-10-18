//
//  CharacterDetailViewController.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 05.10.23.
//

import UIKit
import Popover

class CharacterDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var characterDetailTableView: UITableView?
    
    var character: Character? {
        didSet {
            self.title = character?.name
            self.characterDetailTableView?.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        characterDetailTableView?.estimatedRowHeight = 39
        characterDetailTableView?.rowHeight = UITableView.automaticDimension
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        title = character?.name
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Character.numberOfDetails - 1    // -1 because character's name is displayed in navigation bar
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let character else {
            return UITableViewCell(style: .default, reuseIdentifier: "")
        }
        let type = CharacterDetailType(rawValue: indexPath.row)
        
        switch type {
        case .height:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Height:", value: character.height)
        case .mass:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Weight:", value: character.mass)
        case .hairColor:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Hair color:", value: character.hairColor)
        case .skinColor:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Skin color:", value: character.skinColor)
        case .eyeColor:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Eye color:", value: character.eyeColor)
        case .birthYear:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Birth year:", value: character.birthYear)
        case .createdAt:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Created at:", value: character.createdAt)
        case .editedAt:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Edited at:", value: character.editedAt)
        case .gender:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Gender:", value: character.gender)
        case .homeWorld:
            return LinkTableViewCell.configuredLinkCell(for: tableView, owner: self, with: "Homeworld")
        case .films:
            return LinkTableViewCell.configuredLinkCell(for: tableView, owner: self, with: "Films")
        case .species:
            return LinkTableViewCell.configuredLinkCell(for: tableView, owner: self, with: "Species")
        case .vehicles:
            return LinkTableViewCell.configuredLinkCell(for: tableView, owner: self, with: "Vehicles")
        case .starships:
            return LinkTableViewCell.configuredLinkCell(for: tableView, owner: self, with: "Starships")
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
        
        guard let character else { return }
        
        let type = CharacterDetailType(rawValue: indexPath.row)
        var vc: UIViewController?
        
        switch type {
        case .homeWorld:
            if character.homeworld.count == 0 {
                Info.show(message: "Homeworld list is empty!", of: .info, in: view.bounds.size.width / 2, connect: tableView.cellForRow(at: indexPath)!)
                break
            }
            vc = PlanetListViewController(nibName: "PlanetListViewController", bundle: nil)
            (vc as! PlanetListViewController).planets = [character.homeworld]
        case .films:
            if character.films.count == 0 {
                Info.show(message: "Film list is empty!", of: .info, in: view.bounds.size.width / 2, connect: tableView.cellForRow(at: indexPath)!)
                break
            }
            vc = FilmListViewController(nibName: "FilmListViewController", bundle: nil)
            (vc as! FilmListViewController).films = character.films
        case .species:
            if character.species.count == 0 {
                Info.show(message: "Species list is empty!", of: .info, in: view.bounds.size.width / 2, connect: tableView.cellForRow(at: indexPath)!)
                break
            }
            vc = SpeciesListViewController(nibName: "SpeciesListViewController", bundle: nil)
            (vc as! SpeciesListViewController).allSpecies = character.species
        case .vehicles:
            if character.vehicles.count == 0 {
                Info.show(message: "Vehicle list is empty!", of: .info, in: view.bounds.size.width / 2, connect: tableView.cellForRow(at: indexPath)!)
                break
            }
            vc = VehicleListViewController(nibName: "VehicleListViewController", bundle: nil)
            (vc as! VehicleListViewController).vehicles = character.vehicles
        case .starships:
            if character.starships.count == 0 {
                Info.show(message: "Starship list is empty!", of: .info, in: view.bounds.size.width / 2, connect: tableView.cellForRow(at: indexPath)!)
                break
            }
            vc = StarshipListViewController(nibName: "StarshipListViewController", bundle: nil)
            (vc as! StarshipListViewController).starships = character.starships
        default:
            break
        }
        
        if let vc {
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}
