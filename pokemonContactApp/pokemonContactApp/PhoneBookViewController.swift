//
//  PhoneBookViewController.swift
//  pokemonContactApp
//
//  Created by 단예진 on 7/17/24.
//

#Preview {
    PhoneBookViewController()
}

import UIKit
import Alamofire

class PhoneBookViewController: UIViewController {
    
    // UI 요소 세팅: 프로필 이미지
    private var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true // 선밖으로 나가지 않도록 제한
        imageView.layer.cornerRadius = 90
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.layer.borderWidth = 2.0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // UI 요소 세팅: 랜덤 이미지 버튼
    private lazy var randomButton: UIButton = {
        let button = UIButton()
        button.setTitle("랜덤 이미지 생성", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(randomButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
       return button
    }()
    
    // UI 요소 세팅: 이름 텍스트뷰 생성
    private var nameTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.layer.cornerRadius = 10
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.borderWidth = 2.0
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    // UI 요소 세팅: 전화번호 텍스트뷰 생성
    private var phoneNumberTextView: UITextView = {
        let textView = UITextView()
        textView.layer.cornerRadius = 10
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.borderWidth = 2.0
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 배경화면 색상
        view.backgroundColor = .white
        
        // 네비게이션 타이틀 추가
        self.title = "연락처 추가"
        
        // 네비게이션 우측 적용 버튼 추가
        let applyButton = UIBarButtonItem(title: "적용", style: .plain, target: self, action: #selector(applyButtonTapped))
        navigationItem.rightBarButtonItem = applyButton
        
        // 뷰 추가
        [profileImageView,
         randomButton,
         nameTextView,
         phoneNumberTextView].forEach { view.addSubview($0) }
        
         configureUI()

    }
    
    @objc private func randomButtonTapped() {
           fetchPokemonData()
       }
       
    private func fetchPokemonData() {
            let randomID = Int.random(in: 1...1000)  // 포켓몬 ID 범위는 1부터 1000까지
            
            AF.request("https://pokeapi.co/api/v2/pokemon/\(randomID)").responseDecodable(of: PokemonImageAPI.self) { response in
                switch response.result {
                case .success(let pokemonData):
                    let imageUrlString = pokemonData.sprites.frontDefault
                    guard let imageUrl = URL(string: imageUrlString) else {
                        print("Invalid image URL")
                        return
                    }
                    self.loadImage(from: imageUrl)
                    
                case .failure(let error):
                    print("Error fetching pokemon data: \(error)")
                }
            }
        }
        
        private func loadImage(from url: URL) {
            AF.request(url).responseData { response in
                switch response.result {
                case .success(let imageData):
                    if let image = UIImage(data: imageData) {
                        DispatchQueue.main.async {
                            self.profileImageView.image = image
                        }
                    } else {
                        print("Invalid image data")
                    }
                    
                case .failure(let error):
                    print("Error loading image: \(error)")
                }
            }
        }
    
    private func configureUI() {
        
        // UI 요소 레이아웃
        NSLayoutConstraint.activate([
            
            // profileImageView 레이아웃
            profileImageView.widthAnchor.constraint(equalToConstant: 180),
            profileImageView.heightAnchor.constraint(equalToConstant: 180),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            // randomButton 레이아웃
            randomButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20),
            randomButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // nameTextView 레이아웃
            nameTextView.heightAnchor.constraint(equalToConstant: 42),
            nameTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextView.topAnchor.constraint(equalTo: randomButton.bottomAnchor, constant: 20),
            
            // phoneNumberTextView 레이아웃
            phoneNumberTextView.heightAnchor.constraint(equalToConstant: 42),
            phoneNumberTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            phoneNumberTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            phoneNumberTextView.topAnchor.constraint(equalTo: nameTextView.bottomAnchor, constant: 20),
            
        ])
        
    }
    
    @objc private func applyButtonTapped() {
        
        // 적용버튼 누를 시 홈화면으로 이동
        navigationController?.popToRootViewController(animated: true)
    }

}


