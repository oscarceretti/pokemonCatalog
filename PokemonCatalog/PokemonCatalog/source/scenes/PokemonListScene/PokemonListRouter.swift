//
//  PokemonListRouter.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 13/02/2021.
//

import Foundation
import UIKit
protocol PokemonListRouterProtocol {
    func openPokemonDetail(from: UIViewController, pokemonName: String)
}
final class PokemonListRouter: PokemonListRouterProtocol {

    
    typealias SceneFactory = PokemonDetailSceneFactory
    let sceneFactory: SceneFactory
    
    init(sceneFactory: SceneFactory){
        self.sceneFactory = sceneFactory
    }
    
    func openPokemonDetail(from: UIViewController, pokemonName: String) {
        let vc = self.sceneFactory.buildPokemonDetailScene(pokemonName: pokemonName)
        from.navigationController?.pushViewController(vc, animated: true)
    }
    
}
