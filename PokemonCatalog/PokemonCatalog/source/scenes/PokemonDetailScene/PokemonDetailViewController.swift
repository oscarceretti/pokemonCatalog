//
//  PokemonDetailViewController.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 13/02/2021.
//

import Foundation
import UIKit
import SnapKit
class PokemonDetailViewController: UIViewController {
    
    private var viewModel: PokemonDetailViewModel
    
   
    
    init(viewModel: PokemonDetailViewModel, router: PokemonDetailRouter) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callToViewModelForUIUpdate()
        self.viewModel.callFuncToGetPokemonDetail()
        self.view.backgroundColor = .white
    }
    
    
    func callToViewModelForUIUpdate() {
        
        self.viewModel.bindPokemonNameToController = {
            debugPrint(self.viewModel.pokemonName)
        }
        
        self.viewModel.bindPokemonImagesToController = {
            debugPrint(self.viewModel.pokemonImages)
        }
        
        self.viewModel.bindPokemonStatToController = {
            debugPrint(self.viewModel.pokemonStat)
        }
        
        self.viewModel.bindPokemonTypeToController = {
            debugPrint(self.viewModel.pokemonType)
        }
        
    }
    
}

//PokemonStat(
//    [
//        PokemonCatalog.Stat(
//            baseStat: 58,
//            effort: 0,
//            stat: PokemonCatalog.Species(
//                name: "hp",
//                url: "https://pokeapi.co/api/v2/stat/1/"
//            )
//        ), PokemonCatalog.Stat(
//            baseStat: 64,
//            effort: 0,
//            stat: PokemonCatalog.Species(
//                name: "attack",
//                url: "https://pokeapi.co/api/v2/stat/2/")
//        ), PokemonCatalog.Stat(
//            baseStat: 58,
//            effort: 0,
//            stat: PokemonCatalog.Species(
//                name: "defense",
//                url: "https://pokeapi.co/api/v2/stat/3/")
//        ), PokemonCatalog.Stat(
//            baseStat: 80,
//            effort: 1,
//            stat: PokemonCatalog.Species(
//                name: "special-attack",
//                url: "https://pokeapi.co/api/v2/stat/4/")
//        ), PokemonCatalog.Stat(
//            baseStat: 65,
//            effort: 0,
//            stat: PokemonCatalog.Species(
//                name: "special-defense",
//                url: "https://pokeapi.co/api/v2/stat/5/")
//        ), PokemonCatalog.Stat(
//            baseStat: 80,
//            effort: 1,
//            stat: PokemonCatalog.Species(
//                name: "speed",
//                url: "https://pokeapi.co/api/v2/stat/6/")
//        )
//    ]
//)
