//
//  EinsViewController.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 29.09.23.
//

import UIKit

let filmCellIdentifier: String = "filmCellIdentifier"

class FilmListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView?
    @IBOutlet var activityView: UIActivityIndicatorView?
    
    let provider: FilmProvider = FilmProvider.sharedObject
    
    var films: [String] = [] {
        didSet {
            tableView?.reloadData()
        }
    }
    
    private var _loading:Bool = false
    var loading: Bool {
        get {
            return _loading
        }
        set {
            _loading = newValue
            
            if newValue {
                self.activityView?.startAnimating()
                self.activityView?.isHidden = false
                self.tableView?.isHidden = true
            } else {
                self.activityView?.stopAnimating()
                self.activityView?.isHidden = true
                self.tableView?.isHidden = false
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        title = "StarWars"
        
        navigationItem.leftBarButtonItem = films.count == 0 ? UIBarButtonItem(title: "\u{2630}", style: .plain, target: self, action: #selector(handleGoBack)) : UIBarButtonItem(title: navigationController?.viewControllers[(navigationController?.viewControllers.count)! - 2].title, style: .plain, target: self, action: #selector(handleGoBack))
        
        if films.count == 0 {
            loading = true
            
            provider.fetchAllFilms { error in
                if let error {
                    print("Error: \(error)")
                    
                    return
                } else {
                    print("fertich!")
                    
                    self.loading = false
                    self.tableView?.reloadData()
                }
            }
        } else {
            loading = false
        }
    }
    
    @objc func handleGoBack() {
        navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count == 0 ? provider.numberOfFilms : films.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*let cell = tableView.dequeueReusableCell(withIdentifier: filmCellIdentifier)
        
        if let cell {
            cell.textLabel?.text = provider.film(at: indexPath.row)?.title
            return cell
        } else {
            let newCell = LinkTableViewCell.configuredLinkCell(for: tableView, owner: self, with: provider.film(at: indexPath.row)?.title ?? "")
            
            return newCell
        }*/
        
        if films.count > 0 {
            guard indexPath.row < films.count, indexPath.row > -1,
                  let film = provider.film(at: Int(films[indexPath.row])!) else {
                return UITableViewCell(style: .default, reuseIdentifier: "")
            }
            
            let cell = LinkTableViewCell.configuredLinkCell(for: tableView, owner: self, with: film.title)
            
            return cell
        } else {
            let cell = LinkTableViewCell.configuredLinkCell(for: tableView, owner: self, with: provider.film(at: indexPath.row)?.title ?? "")
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if films.count > 0 {
            if let film = provider.film(at: Int(films[indexPath.row])!) {
                let vc = FilmDetailViewController(nibName: "FilmDetailViewController", bundle: nil)
                
                vc.film = film
                navigationController?.pushViewController(vc, animated: true)
            }
        } else {
            if let myFilm = provider.film(at: indexPath.row) {
                let vc = FilmDetailViewController(nibName: "FilmDetailViewController", bundle: nil)
                
                vc.film = myFilm
                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
