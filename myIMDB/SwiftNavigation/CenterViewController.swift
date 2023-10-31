//
//  CenterViewController.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 28.09.23.
//

import UIKit

class CenterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Home"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.backgroundColor = UIColor(white: 0.9, alpha: 1)
        navigationController?.setStatusBarBackgroundColor(UIColor(white: 0.9, alpha: 1))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "\u{2630}", style: .plain, target: self, action: #selector(handleGoBack))
        navigationItem.leftBarButtonItem?.accessibilityIdentifier = "menu_button"
        navigationController?.navigationBar.titleTextAttributes = [.font: UIFont(name: "AvenirNextCondensed-Heavy", size: 21)!]
    }
    
    @objc func handleGoBack() {
        navigationController?.popViewController(animated: true)
    }    
}
