//
//  CharacterListViewController.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 06.10.23.
//

import UIKit

class CharacterListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var characterListTableView: UITableView?
    
    let provider: CharacterProvider = CharacterProvider.sharedObject
    
    var characters: [String] = [] {
        didSet {
            characterListTableView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Characters"
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row < characters.count, indexPath.row > -1 else {
            return UITableViewCell(style: .default, reuseIdentifier: "")
        }
        
        let character = characters[indexPath.row]
        let cell = LinkTableViewCell.configuredLinkCell(for: tableView, owner: self, with: character)
        
        cell.isLoading = true
        
        provider.fetchCharacter(withId: character) { fullCharacter, error in
            if let error {
                print("Error: \(error)")
                
                return
            }
            
            cell.linkTitle = fullCharacter?.name
            cell.isLoading = false
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let character = characters[indexPath.row]
        
        provider.fetchCharacter(withId: character) { fullCharacter, error in
            if let error {
                print("Error: \(error)")
                
                return
            }
            
            let vc = CharacterDetailViewController(nibName: "CharacterDetailViewController", bundle: nil)
            
            vc.character = fullCharacter
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
