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
    
    var cellProvider: CellProvider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filmDetailsTableView?.estimatedRowHeight = 39
        filmDetailsTableView?.rowHeight = UITableView.automaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        title = film?.title
        
        if cellProvider == nil, let filmDetailsTableView = filmDetailsTableView {
            cellProvider = CellProvider(tableView: filmDetailsTableView, owner: self, cellType: FilmDetailType)
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FilmDetailType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let film = film, let cellProvider = cellProvider else {
            return UITableViewCell(style: .default, reuseIdentifier: "")
        }
        
        return cellProvider.cell(forModel: film, atLine: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let film = film, let cellProvider = cellProvider, let vc = cellProvider.vcToOpen(forModel: film, atLine: indexPath.row) else { return }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if tableView.cellForRow(at: indexPath) is LinkTableViewCell {
            return indexPath
        }
        
        return nil
    }

}
