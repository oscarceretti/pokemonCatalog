//
//  PokemonDetailViewModel.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 13/02/2021.
//

import Foundation

class PokemonDetailViewModel: NSObject {
    
    typealias Dependencies = HasPokemonManager
    let interactor: PokemonDetailInteractorInterface
    
    private(set) var pokemonName: String? {
        didSet {
            guard let name = self.pokemonName else { return }
            self.bindPokemonNameToController(name)
        }
    }
    private(set) var pokemonImages: [String]? {
        didSet {
            guard let sprites = self.pokemonImages else { return }
            self.bindPokemonImagesToController(sprites)
        }
    }
    private(set) var pokemonStat: [PokemonStatEntity]? {
        didSet {
            guard let stats = self.pokemonStat else { return }
            self.bindPokemonStatToController(stats)
        }
    }
    
    private(set) var pokemonType: [Asset]? {
        didSet {
            guard let type = self.pokemonType else { return }
            self.bindPokemonTypeToController(type)
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
    
    var bindPokemonNameToController : (_ name: String) -> () = { _ in}
    var bindPokemonImagesToController : (_ sprites: [String]) -> () = { _ in }
    var bindPokemonStatToController : (_ stats: [PokemonStatEntity]) -> () = { _ in }
    var bindPokemonTypeToController : (_ type: [Asset]) -> () = { _ in }
    var bindErrorViewModelToController : (_ error: String) -> () = { _ in }
    var bindLoadingViewModelToController : (_ loading: Bool) -> () = { _ in }
    
    init (interactor: PokemonDetailInteractorInterface) {
        self.interactor = interactor
    }
    

    func callFuncToGetPokemonDetail() {
        self.loading = true
        self.interactor.getPokemonDetail() { (pokemonName,pokemonImages,statsArray,types,error) in
            
            self.loading = false
            
            self.pokemonName = pokemonName
            
            self.pokemonImages = pokemonImages
            
            self.pokemonStat = statsArray
        
            self.pokemonType = types
            
            self.error = error

        }
    }
    

}
