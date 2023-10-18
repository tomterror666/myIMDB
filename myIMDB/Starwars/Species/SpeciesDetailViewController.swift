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

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Species.numberOfDetails - 1    // -1 because character's name is displayed in navigation bar
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let species else {
            return UITableViewCell(style: .default, reuseIdentifier: "")
        }
        let type = SpeciesDetailType(rawValue: indexPath.row)
        
        switch type {
        case .classification:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Classification:", value: species.classification)
        case .designation:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Designation:", value: species.designation)
        case .averageHeight:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Average height:", value: "\(species.averageHeight) cm")
        case .skinColors:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Skin colors:", value: species.skinColors)
        case .hairColors:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Hair colors:", value: species.hairColors)
        case .eyeVolors:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Eye colors:", value: species.eyeColors)
        case .averageLifespan:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Average livespan:", value: "\(species.averageLifespan) years")
        case .language:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Language:", value: species.language)
        case .created:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Created at:", value: species.createdAt)
        case .edited:
            return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: self, with: "Edited at:", value: species.editedAt)
        case .homeworld:
            return LinkTableViewCell.configuredLinkCell(for: tableView, owner: self, with: "Homeworld")
        case .people:
            return LinkTableViewCell.configuredLinkCell(for: tableView, owner: self, with: "People")
        case .films:
            return LinkTableViewCell.configuredLinkCell(for: tableView, owner: self, with: "Films")
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
        
        guard let species else { return }
        
        let type = SpeciesDetailType(rawValue: indexPath.row)
        var vc: UIViewController?
        
        switch type {
        case .homeworld:
            if species.homeworld.count == 0 {
                Info.show(message: "Homeworld list is empty!", of: .info, in: view.bounds.size.width / 2, connect: tableView.cellForRow(at: indexPath)!)
                break
            }
            vc = PlanetListViewController(nibName: "PlanetListViewController", bundle: nil)
            (vc as! PlanetListViewController).planets = species.homeworld
        case .films:
            if species.films.count == 0 {
                Info.show(message: "Film list is empty!", of: .info, in: view.bounds.size.width / 2, connect: tableView.cellForRow(at: indexPath)!)
                break
            }
            vc = FilmListViewController(nibName: "FilmListViewController", bundle: nil)
            (vc as! FilmListViewController).films = species.films
        case .people:
            if species.people.count == 0 {
                Info.show(message: "People list is empty!", of: .info, in: view.bounds.size.width / 2, connect: tableView.cellForRow(at: indexPath)!)
                break
            }
            vc = CharacterListViewController(nibName: "CharacterListViewController", bundle: nil)
            (vc as! CharacterListViewController).characters = species.people
        default:
            break
        }
        
        if let vc {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
