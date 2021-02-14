//
//  PokemonListRouter.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 13/02/2021.
//

import Foundation
import UIKit
protocol PokemonListRouterProtocol {
    func openPokemonDetail(from: UIViewController, pokemonUrl: String)
}
final class PokemonListRouter: PokemonListRouterProtocol {

    
    typealias SceneFactory = PokemonDetailSceneFactory
    let sceneFactory: SceneFactory
    
    init(sceneFactory: SceneFactory){
        self.sceneFactory = sceneFactory
    }
    
    func openPokemonDetail(from: UIViewController, pokemonUrl: String) {
        let vc = self.sceneFactory.buildPokemonDetailScene(urlString: pokemonUrl)
        from.navigationController?.pushViewController(vc, animated: true)
            //.present(vc, animated: true, completion: nil)
    }
}
