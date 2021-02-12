//
//  CompositionRoot.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 11/02/2021.
//

import Foundation
import UIKit

protocol PokemonListSceneFactory {
    func buildPokemonListScene() -> PokemonListViewController
}
final class CompositionRoot {
    let dependencies = AppDependencies()
}

extension CompositionRoot: PokemonListSceneFactory {
    func buildPokemonListScene() -> PokemonListViewController {
        let viewModel = PokemonListViewModel(dependecies: dependencies)
        let vc = PokemonListViewController(viewModel: viewModel)
        return vc
    }
}
