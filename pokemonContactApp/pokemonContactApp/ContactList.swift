//
//  ContactList.swift
//  pokemonContactApp
//
//  Created by 단예진 on 7/17/24.
//

import UIKit

class ContactList: UIViewController {

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func configureTableView() {
        
        // 테이블 뷰 생성
        view.addSubview(tableView)
        
        // set delegate
        // set row height
        // register cells
        // set constraints
    }

}

extension ContactList: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10 // 임의의 수
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
