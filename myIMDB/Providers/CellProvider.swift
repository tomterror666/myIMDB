//
//  CellProvider.swift
//  myIMDB
//
//  Created by Andre Heß on 19.10.23.
//

import UIKit

class CellProvider: NSObject {
    
    var tableView: UITableView
    
    var owner: UIViewController
    
    var cellTypeArray: [CellType]
    
    init(tableView: UITableView, owner: UIViewController, cellType: [CellType]) {
        self.tableView = tableView
        self.owner = owner
        self.cellTypeArray = cellType
    }

    func cell(forModel model: NSObject, atLine line: Int) -> UITableViewCell {
        let cellType = cellTypeArray[line]
        
        switch cellType.type {
        case .stringValue:
            if var value = model.value(forKey: cellType.propertyName) as? String {
                if let ext = cellType.unitExtension {
                    value = value + " \(ext)"
                }
                return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: owner, with: cellType.propertyLabel, value: value.count > 0 ? value : "unknown")
            }
        case .intValue:
            if let value = model.value(forKey: cellType.propertyName) as? Int {
                var valueStr = "\(value.withSeparator)"
                
                if value == 0 {
                    valueStr = "unknown"
                } else if let ext = cellType.unitExtension {
                    valueStr = valueStr + " \(ext)"
                }
                
                return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: owner, with: cellType.propertyLabel, value: valueStr)
            }
        case .floatValue:
            if let value = model.value(forKey: cellType.propertyName) as? Float {
                var valueStr = "\(value)"
                
                if value == 0 {
                    valueStr = "unknown"
                } else if let ext = cellType.unitExtension {
                    valueStr = valueStr + " \(ext)"
                }
                
                return StringValueTableViewCell.configuredStringValueCell(for: tableView, owner: owner, with: cellType.propertyLabel, value: valueStr)
            }
        case .link:
            return LinkTableViewCell.configuredLinkCell(for: tableView, owner: owner, with: cellType.propertyLabel)
        case .longText:
            return LongTextTableViewCell.configuredLongTextCell(for: tableView, owner: owner, with: model.value(forKey: cellType.propertyName) as! String)
        default:
            break
        }
        
        return UITableViewCell(style: .default, reuseIdentifier: "")
    }
    
    func vcToOpen(forModel model: NSObject, atLine line: Int) -> UIViewController? {
        if model is Character {
            return characterVCToOpen(forModel: model, atLine: line)
        }
        if model is Film {
            return filmVCToOpen(forModel: model, atLine: line)
        }
        if model is Planet {
            return planetVCToOpen(forModel: model, atLine: line)
        }
        if model is Species {
            return speciesVCToOpen(forModel: model, atLine: line)
        }
        if model is Starship {
            return starshipVCToOpen(forModel: model, atLine: line)
        }
        if model is Vehicle {
            return vehicleVCToOpen(forModel: model, atLine: line)
        }
        
        return nil
    }

    // MARK: - private functions for vc to open
    
    private func characterVCToOpen(forModel model: NSObject, atLine line: Int) -> UIViewController? {
        let cellType = CharacterDetailType[line]
        let character = model as! Character
        
        if cellType.type == .link, let className = cellType.vcClassName {
            if className == "PlanetListViewController" {
                return planetListVC(forPlanets: character.homeworld, atLine: line)
            }
            if className == "FilmListViewController" {
                return filmListVC(forFilms: character.films, atLine: line)
            }
            if className == "SpeciesListViewController" {
                return speciesListVC(forSpecies: character.species, atLine: line)
            }
            if className == "VehicleListViewController" {
                return vehicleListVC(forVehicles: character.vehicles, atLine: line)
            }
            if className == "StarshipListViewController" {
                return starshipListVC(forStarships: character.starships, atLine: line)
            }
        }
        
        return nil
    }
    
    private func filmVCToOpen(forModel model: NSObject, atLine line: Int) -> UIViewController? {
        let cellType = FilmDetailType[line]
        let film = model as! Film
        
        if cellType.type == .link, let className = cellType.vcClassName {
            switch className {
            case "PlanetListViewController":
                return planetListVC(forPlanets: film.planets, atLine: line)
            case "CharacterListViewController":
                return characterListVC(forCharacters: film.characters, atLine: line)
            case "SpeciesListViewController":
                return speciesListVC(forSpecies: film.species, atLine: line)
            case "VehicleListViewController":
                return vehicleListVC(forVehicles: film.vehicles, atLine: line)
            case "StarshipListViewController":
                return starshipListVC(forStarships: film.starships, atLine: line)
            default:
                break
            }
        }
        
        return nil
    }
    
    private func planetVCToOpen(forModel model: NSObject, atLine line: Int) -> UIViewController? {
        let cellType = PlanetDetailType[line]
        let planet = model as! Planet
        
        if cellType.type == .link, let className = cellType.vcClassName {
            switch className {
            case "FilmListViewController":
                return filmListVC(forFilms: planet.films, atLine: line)
            case "CharacterListViewController":
                return characterListVC(forCharacters: planet.residents, atLine: line)
            default:
                break
            }
        }
        
        return nil
    }
    
    private func speciesVCToOpen(forModel model: NSObject, atLine line: Int) -> UIViewController? {
        let cellType = SpeciesDetailType[line]
        let species = model as! Species
        
        if cellType.type == .link, let className = cellType.vcClassName {
            switch className {
            case "PlanetListViewController":
                return planetListVC(forPlanets: species.homeworld, atLine: line)
            case "CharacterListViewController":
                return characterListVC(forCharacters: species.people, atLine: line)
            case "FilmListViewController":
                return filmListVC(forFilms: species.films, atLine: line)
            default:
                break
            }
        }
        
        return nil
    }
    
    private func vehicleVCToOpen(forModel model: NSObject, atLine line: Int) -> UIViewController? {
        let cellType = VehicleDetailType[line]
        let vehicle = model as! Vehicle
        
        if cellType.type == .link, let className = cellType.vcClassName {
            switch className {
            case "FilmListViewController":
                return filmListVC(forFilms: vehicle.films, atLine: line)
            case "CharacterListViewController":
                return characterListVC(forCharacters: vehicle.pilots, atLine: line)
            default:
                break
            }
        }
        
        return nil
    }
    
    private func starshipVCToOpen(forModel model: NSObject, atLine line: Int) -> UIViewController? {
        let cellType = StarshipDetailType[line]
        let starship = model as! Starship
        
        if cellType.type == .link, let className = cellType.vcClassName {
            switch className {
            case "FilmListViewController":
                return filmListVC(forFilms: starship.films, atLine: line)
            case "CharacterListViewController":
                return characterListVC(forCharacters: starship.pilots, atLine: line)
            default:
                break
            }
        }
        
        return nil
    }
    
    // MARK: - private functions for list vc
    
    private func planetListVC(forPlanets planets: [String], atLine line: Int) -> PlanetListViewController? {
        if planets.count == 0 {
            Info.show(message: "Planet list is empty!", of: .info, in: owner.view.bounds.size.width / 2, connect: tableView.cellForRow(at: IndexPath(row: line, section: 0))!)
            
            return nil
        }
        let vc = PlanetListViewController(nibName: "PlanetListViewController", bundle: nil)
        vc.planets = planets
        
        return vc
    }
    
    private func filmListVC(forFilms films: [String], atLine line: Int) -> FilmListViewController? {
        if films.count == 0 {
            Info.show(message: "Film list is empty!", of: .info, in: owner.view.bounds.size.width / 2, connect: tableView.cellForRow(at: IndexPath(row: line, section: 0))!)
            
            return nil
        }
        let vc = FilmListViewController(nibName: "FilmListViewController", bundle: nil)
        vc.films = films
        
        return vc
    }
    
    private func speciesListVC(forSpecies species: [String], atLine line: Int) -> SpeciesListViewController? {
        if species.count == 0 {
            Info.show(message: "Species list is empty!", of: .info, in: owner.view.bounds.size.width / 2, connect: tableView.cellForRow(at: IndexPath(row: line, section: 0))!)
            
            return nil
        }
        let vc = SpeciesListViewController(nibName: "SpeciesListViewController", bundle: nil)
        vc.allSpecies = species
        
        return vc
    }
    
    private func vehicleListVC(forVehicles vehicles: [String], atLine line: Int) -> VehicleListViewController? {
        if vehicles.count == 0 {
            Info.show(message: "Vehicle list is empty!", of: .info, in: owner.view.bounds.size.width / 2, connect: tableView.cellForRow(at: IndexPath(row: line, section: 0))!)
            
            return nil
        }
        let vc = VehicleListViewController(nibName: "VehicleListViewController", bundle: nil)
        vc.vehicles = vehicles
        
        return vc
    }
    
    private func starshipListVC(forStarships starships: [String], atLine line: Int) -> StarshipListViewController? {
        if starships.count == 0 {
            Info.show(message: "Starship list is empty!", of: .info, in: owner.view.bounds.size.width / 2, connect: tableView.cellForRow(at: IndexPath(row: line, section: 0))!)
            
            return nil
        }
        let vc = StarshipListViewController(nibName: "StarshipListViewController", bundle: nil)
        vc.starships = starships
        
        return vc
    }
    
    private func characterListVC(forCharacters characters: [String], atLine line: Int) -> CharacterListViewController? {
        if characters.count == 0 {
            Info.show(message: "Character list is empty!", of: .info, in: owner.view.bounds.size.width, connect: tableView.cellForRow(at: IndexPath(row: line, section: 0))!)
            
            return nil
        }
        let vc = CharacterListViewController(nibName: "CharacterListViewController", bundle: nil)
        vc.characters = characters
        
        return vc
    }
}
