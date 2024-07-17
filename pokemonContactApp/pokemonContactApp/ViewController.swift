//
//  ViewController.swift
//  pokemonContactApp
//
//  Created by 단예진 on 7/16/24.
//

import UIKit

class ViewController: UIViewController {
    
    // UI 요소 세팅: 친구목록 타이틀 라벨
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "친구목록"
        label.font = .boldSystemFont(ofSize: 22)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // UI 요소 세팅: 추가 버튼
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("추가", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // UI 요소 세팅: 테이블 뷰
    private let contactTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 80
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "Info")
        return tableView
    }()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 배경화면
        view.backgroundColor = .white
        
        // 뷰 추가
        [titleLabel, addButton, contactTableView].forEach { view.addSubview($0) }
        
        configurationUI()
        setTableViewDelegate()
    }
    
    private func configurationUI() {
        
        // UI 요소 레이아웃
        NSLayoutConstraint.activate([
            
            // title Label 레이아웃
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            // addButton 레이아웃
            addButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            // contactTableView 레이아웃
            contactTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            contactTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            contactTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            contactTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
        
    }
    
    func setTableViewDelegate() {
        contactTableView.delegate = self
        contactTableView.dataSource = self
    }
    
    @objc func addButtonTapped() {
        
        let phoneBookViewController = PhoneBookViewController()
        
        // 버튼을 눌렀을 때 PhoneBookViewController로 넘어갈 수 있게 하는 코드
        navigationController?.pushViewController(phoneBookViewController, animated: true)
        
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
        // 임의의 수
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Info", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        
        // 셀을 구성하는 요소
        cell.nameLabel.text = "name"
        cell.phoneNumberLabel.text = "010-1111-2222"
        
        return cell
    }
}
