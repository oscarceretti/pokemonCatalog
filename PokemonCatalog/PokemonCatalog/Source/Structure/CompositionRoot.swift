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
protocol PokemonDetailSceneFactory {
    func buildPokemonDetailScene() -> PokemonDetailViewController
}
final class CompositionRoot {
    let dependencies = AppDependencies()
}

extension CompositionRoot: PokemonListSceneFactory {
    func buildPokemonListScene() -> PokemonListViewController {
        let viewModel = PokemonListViewModel(dependecies: dependencies)
        let router = PokemonListRouter(sceneFactory: self)
        let vc = PokemonListViewController(viewModel: viewModel, router: router)
        return vc
    }
}

extension CompositionRoot: PokemonDetailSceneFactory {
    func buildPokemonDetailScene() -> PokemonDetailViewController {
        let viewModel = PokemonDetailViewModel(dependecies: dependencies)
        let router = PokemonDetailRouter(sceneFactory: self)
        let vc = PokemonDetailViewController(viewModel: viewModel, router: router)
        return vc
    }
}
