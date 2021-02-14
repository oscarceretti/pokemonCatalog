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
    
    private var pokeData: PokemonList?
    private(set) var pokeDatasource: [Pokemon]? {
        didSet {
            self.bindPokemonListViewModelToController()
        }
    }
    var bindPokemonListViewModelToController : (() -> ()) = { }
    
    
    init (dependecies: Dependencies) {
        self.dependecies = dependecies
    }
    

    func callFuncToGetPokemonList() {
        self.dependecies.pokemonManager.getPokemonList(next: self.pokeData?.next){ (pokemonList,error) in
            self.pokeData = pokemonList
            self.pokeDatasource = pokemonList?.results
        }
    }
    
}
