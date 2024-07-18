//
//  TableViewCell.swift
//  pokemonContactApp
//
//  Created by 단예진 on 7/16/24.
//

#Preview {
    ViewController()
}

import UIKit
import CoreData

class TableViewCell: UITableViewCell {
    
    // UI 요소 정의
    let profileImageView = UIImageView()
    let nameLabel = UILabel()
    let phoneNumberLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        // 오토레이아웃 비활성화
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // 이름 라벨 UI 속성
        nameLabel.font = .systemFont(ofSize: 16)
        nameLabel.textColor = .black
        
        // 이미지뷰 UI 속성
        profileImageView.image = UIImage(systemName: "circle.fill")
        profileImageView.tintColor = .clear 
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.clipsToBounds = true
        
        // 이미지뷰 UI 속성 디테일
        profileImageView.layer.cornerRadius = 30 // Half of width or height to make it circular
        profileImageView.layer.borderWidth = 2.0
        profileImageView.layer.borderColor = UIColor.gray.cgColor
        
        // 전화번호 라벨 UI 속성
        phoneNumberLabel.font = .systemFont(ofSize: 16)
        phoneNumberLabel.textColor = .gray
        
        // 셀에 추가
        contentView.addSubview(profileImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(phoneNumberLabel)
    }
    
    private func setupConstraints() {
        
        // 셀에 들어간 UI 제약 설정
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            profileImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 60),
            profileImageView.heightAnchor.constraint(equalToConstant: 60),
            
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 15),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: phoneNumberLabel.leadingAnchor, constant: -15),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            phoneNumberLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            phoneNumberLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
 
    }
    
}


