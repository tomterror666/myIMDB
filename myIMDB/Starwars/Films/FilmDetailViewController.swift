//
//  FilmDetailViewController.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 01.10.23.
//

import UIKit

class FilmDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let filmDetailCellIdentifier = "filmDetailCellIdentifier"
    
    @IBOutlet var filmDetailsTableView: UITableView?
    
    var film: Film? {
        didSet {
            self.title = film?.title
            self.filmDetailsTableView?.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        filmDetailsTableView?.estimatedRowHeight = 39
        filmDetailsTableView?.rowHeight = UITableView.automaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        title = film?.title
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Film.numberOfDetails - 1 // -1 because film's title is displayed in navigation bar
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let filmDetailsTableView, let film else {
            return UITableViewCell(style: .default, reuseIdentifier: "")
        }
        
        let type = FilmDetailType(rawValue: indexPath.row)
        
        switch type {
        case .createdAt:
            return StringValueTableViewCell.configuredStringValueCell(for: filmDetailsTableView, owner: self, with: "Created at:", value: film.createdAt)
        case .director:
            return StringValueTableViewCell.configuredStringValueCell(for: filmDetailsTableView, owner: self, with: "Director:", value: film.director)
        case .editedAt:
            return StringValueTableViewCell.configuredStringValueCell(for: filmDetailsTableView, owner: self, with: "Edited at:", value: film.editedAt)
        case .releaseDate:
            return StringValueTableViewCell.configuredStringValueCell(for: filmDetailsTableView, owner: self, with: "Released at:", value: film.releaseDate)
        case .producers:
            return StringValueTableViewCell.configuredStringValueCell(for: filmDetailsTableView, owner: self, with: "Producers:", value: film.producers)
        case .openingCrawl:
            return LongTextTableViewCell.configuredLongTextCell(for: filmDetailsTableView, owner: self, with: film.openingCrawl)
        case .characters:
            return LinkTableViewCell.configuredLinkCell(for: filmDetailsTableView, owner: self, with: "Characters")
        case .planets:
            return LinkTableViewCell.configuredLinkCell(for: filmDetailsTableView, owner: self, with: "Planets")
        case .spaceships:
            return LinkTableViewCell.configuredLinkCell(for: filmDetailsTableView, owner: self, with: "Spaceships")
        case .species:
            return LinkTableViewCell.configuredLinkCell(for: filmDetailsTableView, owner: self, with: "Species")
        case .vehicles:
            return LinkTableViewCell.configuredLinkCell(for: filmDetailsTableView, owner: self, with: "Vehicles")
        default:
            return UITableViewCell(style: .default, reuseIdentifier: "")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let characters = film?.characters, let planets = film?.planets, let species = film?.species, let starships = film?.starships, let vehicles = film?.vehicles else { return }
        let type = FilmDetailType(rawValue: indexPath.row)
        var vc: UIViewController?
        
        switch type {
        case .characters:
            vc = CharacterListViewController(nibName: "CharacterListViewController", bundle: nil)
            (vc as! CharacterListViewController).characters = characters
        case .planets:
            vc = PlanetListViewController(nibName: "PlanetListViewController", bundle: nil)
            (vc as! PlanetListViewController).planets = planets
            break
        case .spaceships:
            vc = StarshipListViewController(nibName: "StarshipListViewController", bundle: nil)
            (vc as! StarshipListViewController).starships = starships
        case .species:
            vc = SpeciesListViewController(nibName: "SpeciesListViewController", bundle: nil)
            (vc as! SpeciesListViewController).allSpecies = species
        case .vehicles:
            vc = VehicleListViewController(nibName: "VehicleListViewController", bundle: nil)
            (vc as! VehicleListViewController).vehicles = vehicles
        default:
            break
        }
        
        if let vc {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if tableView.cellForRow(at: indexPath) is LinkTableViewCell {
            return indexPath
        }
        
        return nil
    }

}
