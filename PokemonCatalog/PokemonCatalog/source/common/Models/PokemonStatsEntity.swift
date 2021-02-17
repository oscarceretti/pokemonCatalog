//
//  PokemonStatsEntity.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 17/02/2021.
//

import Foundation

struct PokemonStatEntity {
    let name: String
    let value: String
    let percentage: Float
    
    init(name:String, value: String, percentage: Float) {
        self.name = name
        self.value = value
        self.percentage = percentage
    }
}
