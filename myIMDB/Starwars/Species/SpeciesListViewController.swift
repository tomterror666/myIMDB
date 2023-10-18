//
//  SpeciesListViewController.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 16.10.23.
//

import UIKit

class SpeciesListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var speciesListTableView: UITableView?
    
    let provider: SpeciesProvider = SpeciesProvider.sharedObject
    
    var allSpecies: [String] = [] {
        didSet {
            speciesListTableView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Species"
    }


    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allSpecies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row < allSpecies.count, indexPath.row > -1 else {
            return UITableViewCell(style: .default, reuseIdentifier: "")
        }
        
        let species = allSpecies[indexPath.row]
        let cell = LinkTableViewCell.configuredLinkCell(for: tableView, owner: self, with: species)
        
        cell.isLoading = true
        
        provider.fetchSpecies(withId: species) { fullSpecies, error in
            if let error {
                print("Error: \(error)")
                
                return
            }
            
            cell.linkTitle = fullSpecies?.name
            cell.isLoading = false
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let species = allSpecies[indexPath.row]
        
        provider.fetchSpecies(withId: species) { fullSpecies, error in
            if let error {
                print("Error: \(error)")
                
                return
            }
            
            let vc = SpeciesDetailViewController(nibName: "SpeciesDetailViewController", bundle: nil)
            
            vc.species = fullSpecies
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
