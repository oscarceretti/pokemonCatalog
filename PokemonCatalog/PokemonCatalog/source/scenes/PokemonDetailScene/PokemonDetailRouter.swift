//
//  PokemonDetailRouter.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 13/02/2021.
//

import Foundation
import UIKit
protocol PokemonDetailRouterProtocol {
    func routeBack(from: UIViewController)
}
final class PokemonDetailRouter: PokemonDetailRouterProtocol {

    
    typealias SceneFactory = PokemonDetailSceneFactory
    let sceneFactory: SceneFactory
    
    init(sceneFactory: SceneFactory){
        self.sceneFactory = sceneFactory
    }
    
    func routeBack(from: UIViewController) {
        from.navigationController?.popViewController(animated: true)
    }
}
