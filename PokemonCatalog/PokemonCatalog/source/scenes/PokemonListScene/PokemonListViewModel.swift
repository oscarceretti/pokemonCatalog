//
//  PokemonLIstViewModel.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 09/02/2021.
//
//


import Foundation

class PokemonListViewModel: NSObject {

    let interactor: PokemonListInteractorInterface
    
    private(set) var pokeDatasource: [Pokemon]? {
        didSet {
            self.bindPokemonListViewModelToController()
        }
    }
    var bindPokemonListViewModelToController : (() -> ()) = { }


    init (interactor: PokemonListInteractorInterface) {
        self.interactor = interactor
    }

    func callFuncToGetPokemonList() {
        self.interactor.getPokemonEntity(){ (pokemonList,error) in
            self.pokeDatasource = pokemonList
        }
    }

}
