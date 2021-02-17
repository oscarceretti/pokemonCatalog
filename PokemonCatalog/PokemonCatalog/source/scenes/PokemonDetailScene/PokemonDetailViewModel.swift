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
            self.bindPokemonNameToController()
        }
    }
    private(set) var pokemonImages: [String]? {
        didSet {
            self.bindPokemonImagesToController()
        }
    }
    private(set) var pokemonStat: [String:Int]? {
        didSet {
            self.bindPokemonStatToController()
        }
    }
    
    private(set) var pokemonType: [Asset]? {
        didSet {
            self.bindPokemonTypeToController()
        }
    }
    
    var bindPokemonNameToController : (() -> ()) = { }
    var bindPokemonImagesToController : (() -> ()) = { }
    var bindPokemonStatToController : (() -> ()) = { }
    var bindPokemonTypeToController : (() -> ()) = { }
    
    init (interactor: PokemonDetailInteractorInterface) {
        self.interactor = interactor
    }
    

    func callFuncToGetPokemonDetail() {
        self.interactor.getPokemonDetail() { (pokemonName,pokemonImages,statsDict,types,error) in
            
            self.pokemonName = pokemonName
            self.pokemonImages = pokemonImages
            self.pokemonStat = statsDict
            self.pokemonType = types

        }
    }
    

}
