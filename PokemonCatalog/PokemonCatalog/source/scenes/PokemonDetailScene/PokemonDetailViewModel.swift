//
//  PokemonDetailViewModel.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 13/02/2021.
//

import Foundation

class PokemonDetailViewModel: NSObject {
    
    typealias Dependencies = HasPokemonManager
    let dependecies: Dependencies
    let pokemonUrl: String
    
    
    private(set) var pokemonName: String? {
        didSet {
            self.bindPokemonNameToController()
        }
    }
    private(set) var pokemonImages: [String?]? {
        didSet {
            self.bindPokemonImagesToController()
        }
    }
    private(set) var pokemonStat: [Stat]? {
        didSet {
            self.bindPokemonStatToController()
        }
    }
    
    private(set) var pokemonType: [TypeElement]? {
        didSet {
            self.bindPokemonTypeToController()
        }
    }
    
    var bindPokemonNameToController : (() -> ()) = { }
    var bindPokemonImagesToController : (() -> ()) = { }
    var bindPokemonStatToController : (() -> ()) = { }
    var bindPokemonTypeToController : (() -> ()) = { }
    
    init (dependecies: Dependencies, urlString: String) {
        self.dependecies = dependecies
        self.pokemonUrl = urlString
        
    }
    

    func callFuncToGetPokemonDetail() {
        self.dependecies.pokemonManager.getPokemonDetail(urlString: pokemonUrl) { pokemonDetail in

            self.pokemonName = pokemonDetail.name
            self.pokemonImages = [
                pokemonDetail.sprites?.backDefault,
                pokemonDetail.sprites?.backFemale,
                pokemonDetail.sprites?.backShiny,
                pokemonDetail.sprites?.backShinyFemale,
                pokemonDetail.sprites?.frontDefault,
                pokemonDetail.sprites?.frontFemale,
                pokemonDetail.sprites?.frontShiny,
                pokemonDetail.sprites?.frontShinyFemale,
            ]
            self.pokemonStat = pokemonDetail.stats
            self.pokemonType = pokemonDetail.types
        }
    }
    

}
