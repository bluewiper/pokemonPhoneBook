//
//  pokemonImageAPI.swift
//  pokemonContactApp
//
//  Created by 단예진 on 7/17/24.
//

import Foundation

// Codable을 채택하는 구조체 생성
struct PokemonImageAPI: Codable {
    let id: Int
    let name: String
    let sprites: Sprites
}

// 이미지
struct Sprites: Codable {
    // 이미지 URL
    let frontDefault: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}
