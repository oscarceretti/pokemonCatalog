//
//  PokemonLIstViewModel.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 09/02/2021.
//
//


import Foundation

class PokemonListViewModel: NSObject {
    
    typealias Dependencies = HasPokemonManager
    let dependecies: Dependencies
    
    private(set) var pokeData: PokemonList? {
        didSet {
            self.bindPokemonListViewModelToController()
        }
    }
    
    var bindPokemonListViewModelToController : (() -> ()) = { }
    
    
    init (dependecies: Dependencies) {
        self.dependecies = dependecies
    }
    

    func callFuncToGetPokemonList() {
        self.dependecies.pokemonManager.getPokemonList(next: self.pokeData?.next){ (pokemonList) in
            self.pokeData = pokemonList
        }
    }
    
    func getPokemonDetailAsTest(urlString: String) {
        self.dependecies.pokemonManager.getPokemonDetail(urlString: urlString) { pokemonDetail in
            debugPrint(pokemonDetail)
        }
    }
}
