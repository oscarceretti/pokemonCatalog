//
//  PokemonLIstViewModel.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 09/02/2021.
//
//
//import Foundation
//
//class PokemonListViewModel: NSObject {
//
//    private var apiService: APIService!
//    private(set) var pokeData: PokemonList! {
//        didSet {
//            self.bindPokemonListViewModelToController()
//        }
//    }
//
//    var bindPokemonListViewModelToController : (() -> ()) = {}
//
//
//    override init() {
//        super.init()
//        self.apiService = APIService()
//        callFuncToGetPokemonList()
//    }
//
//    func callFuncToGetPokemonList() {
//        self.apiService.getPokemonList{ (pokemonList) in
//            print(pokemonList)
//        }
//
//    }
//}
//

//
//  PokemonLIstViewModel.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 09/02/2021.
//

import Foundation




class PokemonListViewModel: NSObject {
    typealias Dependencies = HasPokemonManager
    let dependecies: Dependencies
    //private var apiService: PokemonManager!
    private(set) var pokeData: PokemonList! {
        didSet {
            self.bindPokemonListViewModelToController()
        }
    }
    
    var bindPokemonListViewModelToController : (() -> ()) = {}
    
    
    init (dependecies: Dependencies) {
        self.dependecies = dependecies
    }
    

    
    func callFuncToGetPokemonList() {
        self.dependecies.pokemonManager.getPokemonList{ (pokemonList) in
            print(pokemonList)
        }
        
    }
}
