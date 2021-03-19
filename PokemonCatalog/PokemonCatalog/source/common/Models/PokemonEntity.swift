//
//  PokemonEntity.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 19/02/2021.
//

import Foundation
struct PokemonEntity {
    let name: String
    let sprite: URL
    
    init(name:String, sprite: URL) {
        self.name = name
        self.sprite = sprite
    }
}
