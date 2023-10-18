//
//  RootViewController.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 28.09.23.
//

import UIKit

let menuCellIdentifier: String = "menuCellIdentifier"

class LeftViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var menuItems: [MenuEntry]?
    
    @IBOutlet var menuTableView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.backgroundColor = UIColor(white: 0.9, alpha: 1)
        navigationController?.setStatusBarBackgroundColor(UIColor(white: 0.9, alpha: 1))
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "\u{2630}", style: .plain, target: self, action: #selector(handleGoBack))
        navigationController?.navigationBar.titleTextAttributes = [.font: UIFont(name: "AvenirNextCondensed-Heavy", size: 21)!]
        
        title = "Menu"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @objc func handleGoBack() {
        navigationController?.popViewController(animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let menuCell = tableView.dequeueReusableCell(withIdentifier: menuCellIdentifier)
        
        if let cell = menuCell, let entry = menuItems?[indexPath.row] {
            cell.textLabel?.text = entry.title
            cell.accessoryType = .disclosureIndicator
            
            return cell
        }
        
        let cell = LinkTableViewCell.configuredLinkCell(for: tableView, owner: self, with: menuItems?[indexPath.row].title ?? "")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let menuEntry = menuItems?[indexPath.row], let vcClass = NSClassFromString("myIMDB." + menuEntry.controllerClassName) as? UIViewController.Type else { return }
        
          
        
        let vc = vcClass.init(nibName: menuEntry.controllerClassName, bundle: nil)
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
