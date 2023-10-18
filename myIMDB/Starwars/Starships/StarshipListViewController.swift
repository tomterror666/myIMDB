//
//  StarshipListViewController.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 16.10.23.
//

import UIKit

class StarshipListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var starshipListTableView: UITableView?

    let provider: StarshipProvider = StarshipProvider.sharedObject
    
    var starships: [String] = [] {
        didSet {
            starshipListTableView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Starships"
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starships.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row < starships.count, indexPath.row > -1 else {
            return UITableViewCell(style: .default, reuseIdentifier: "")
        }
        
        let starship = starships[indexPath.row]
        let cell = LinkTableViewCell.configuredLinkCell(for: tableView, owner: self, with: starship)
        
        cell.isLoading = true
        
        provider.fetchStarship(withId: starship) { fullStarship, error in
            if let error {
                print("Error: \(error)")
                
                return
            }
            
            cell.linkTitle = fullStarship?.name
            cell.isLoading = false
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let starship = starships[indexPath.row]
        
        provider.fetchStarship(withId: starship) { fullStarship, error in
            if let error {
                print("Error: \(error)")
                
                return
            }
            
            let vc = StarshipDetailViewController(nibName: "StarshipDetailViewController", bundle: nil)
            
            vc.starship = fullStarship
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
