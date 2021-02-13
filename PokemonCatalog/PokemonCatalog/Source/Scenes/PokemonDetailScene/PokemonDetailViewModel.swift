//
//  PokemonDetailViewModel.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 13/02/2021.
//

import Foundation

class PokemonDetailViewModel: NSObject {
    
    typealias Dependencies = HasPokemonManager
    let dependecies: Dependencies

    init (dependecies: Dependencies) {
        self.dependecies = dependecies
    }
    
}
