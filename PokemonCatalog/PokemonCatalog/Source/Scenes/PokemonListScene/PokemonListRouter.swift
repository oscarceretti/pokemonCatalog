//
//  PokemonListRouter.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 13/02/2021.
//

import Foundation
import UIKit
protocol PokemonListRouterProtocol {
    func openPokemonDetail(from: UIViewController)
}
final class PokemonListRouter: PokemonListRouterProtocol {

    
    typealias SceneFactory = PokemonDetailSceneFactory
    let sceneFactory: SceneFactory
    
    init(sceneFactory: SceneFactory){
        self.sceneFactory = sceneFactory
    }
    
    func openPokemonDetail(from: UIViewController) {
        let vc = self.sceneFactory.buildPokemonDetailScene()
        from.navigationController?.present(vc, animated: true, completion: nil)
    }
}
