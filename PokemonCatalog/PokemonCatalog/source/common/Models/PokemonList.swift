//
//  PokemonList.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 09/02/2021.
//

import Foundation
import Foundation

// MARK: - PokemonList
struct PokemonList: Codable {
    let count: Int
    let next, previous: String?
    let results: [Pokemon]
}

// MARK: - Pokemon
struct Pokemon: Codable {
    let name: String
    let url: String
    let sprite: String?
}



