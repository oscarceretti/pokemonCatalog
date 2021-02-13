//
//  AppDependecies.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 11/02/2021.
//

import Foundation

final class AppDependencies: HasPokemonManager {
    lazy var pokemonManager: PokemonManagerProtocol = PokemonManager()
}
