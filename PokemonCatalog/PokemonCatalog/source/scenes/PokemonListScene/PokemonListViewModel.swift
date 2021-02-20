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
    
    private(set) var pokeDatasource: [PokemonEntity]? {
        didSet {
            guard let datasource = self.pokeDatasource else { return }
            self.bindPokemonListViewModelToController(datasource)
        }
    }
    
    private(set) var error: String? {
        didSet {
            guard let error = self.error else { return }
            self.bindErrorViewModelToController(error)
        }
    }
    
    private(set) var loading: Bool? {
        didSet {
            guard let loading = self.loading else { return }
            self.bindLoadingViewModelToController(loading)
        }
    }
    
    var bindPokemonListViewModelToController : (_ datasource: [PokemonEntity]) -> () = { _ in }
    var bindErrorViewModelToController : (_ error: String) -> () = {_ in}
    var bindLoadingViewModelToController : (_ loading: Bool) -> () = { _ in }

    init (interactor: PokemonListInteractorInterface) {
        self.interactor = interactor
    }

    func callFuncToGetPokemonList() {
        
        self.loading = true
        self.interactor.getPokemonEntity(){ (pokemonList,error) in
            self.pokeDatasource = pokemonList
            self.error = error
            self.loading = false
        }
        
    }

}
