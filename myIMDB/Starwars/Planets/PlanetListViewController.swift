//
//  PlanetListViewController.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 12.10.23.
//

import UIKit

class PlanetListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var planetListTableView: UITableView?
    
    var provider: PlanetProvider = PlanetProvider.sharedObject
    
    var planets: [String] = [] {
        didSet {
            planetListTableView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Planets"
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row < planets.count, indexPath.row > -1 else {
            return UITableViewCell(style: .default, reuseIdentifier: "")
        }
        
        let planet = planets[indexPath.row]
        let cell = LinkTableViewCell.configuredLinkCell(for: tableView, owner: self, with: planet)
        
        cell.accessibilityIdentifier = "\(indexPath.row)"
        cell.isLoading = true
        
        provider.fetchPlanet(withId: planet) { fullPlanet, error in
            if let error {
                print("Error: \(error)")
                
                return
            }
            
            cell.linkTitle = fullPlanet?.name
            cell.isLoading = false
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let planet = planets[indexPath.row]
        
        provider.fetchPlanet(withId: planet) { fullPlanet, error in
            if let error {
                print("Error: \(error)")
                
                return
            }
            
            let vc = PlanetDetailsViewController(nibName: "PlanetDetailsViewController", bundle: nil)
            
            vc.planet = fullPlanet
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

}
