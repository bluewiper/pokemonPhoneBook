//
//  ContactListVC.swift
//  pokemonContactApp
//
//  Created by 단예진 on 7/17/24.
//

import UIKit

class ContactListVC: UIViewController {
    
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTableView()
        // Do any additional setup after loading the view.
    }
    
    func setUpTableView() {
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20)
            
        ])
        
        
    }

}
