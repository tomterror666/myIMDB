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
    
    var cellProvider: CellProvider?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        characterDetailTableView?.estimatedRowHeight = 39
        characterDetailTableView?.rowHeight = UITableView.automaticDimension
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        title = character?.name
        
        if cellProvider == nil, let characterDetailTableView {
            cellProvider = CellProvider(tableView: characterDetailTableView, owner: self, cellType: CharacterDetailType)
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Character.numberOfDetails - 1    // -1 because character's name is displayed in navigation bar
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let character, let cellProvider else {
            return UITableViewCell(style: .default, reuseIdentifier: "")
        }
        
        return cellProvider.cell(forModel: character, atLine: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if tableView.cellForRow(at: indexPath) is LinkTableViewCell {
            return indexPath
        }
            
        return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let character, let cellProvider, let vc = cellProvider.vcToOpen(forModel: character, atLine: indexPath.row) else { return }
        
        navigationController?.pushViewController(vc, animated: true)
    }

}
