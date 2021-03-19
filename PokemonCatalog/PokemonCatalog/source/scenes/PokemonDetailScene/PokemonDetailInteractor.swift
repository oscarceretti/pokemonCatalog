//
//  PokemonDetailInteractor.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 16/02/2021.
//

import Foundation
protocol PokemonDetailInteractorInterface {
    func getPokemonDetail(completion: @escaping (String?, [String], [PokemonStatEntity], [Asset], String?) -> ())
}

final class PokemonDetailInteractor: PokemonDetailInteractorInterface {
    
    typealias Dependencies = HasPokemonManager
    let dependencies: Dependencies
    let pokemonName: String
    private var pokeData: PokemonList?
    
    init (dependencies: Dependencies, pokemonName: String) {
        self.dependencies = dependencies
        self.pokemonName = pokemonName
    }
    
    deinit{}
    
    func getPokemonDetail(completion: @escaping (String?, [String], [PokemonStatEntity], [Asset], String?) -> ()) {
        self.dependencies.pokemonManager.getPokemonDetail(pokemonName: "https://pokeapi.co/api/v2/pokemon/\(pokemonName)" ) { (result) in

            switch result {
            
            case .success(let pokemonDetail):
                completion(
                    pokemonDetail.name,
                    self.getImages(sprites: pokemonDetail.sprites),
                    self.getStatDict(statsArray: pokemonDetail.stats),
                    self.getTypes(types: pokemonDetail.types), nil
                    )
            case .failure(let error):
                completion (nil, [], [], [], error.localizedDescription)
            }
            
        }
    }
    
    // MARK: - Helpers Methods
    private func getImages(sprites: Sprites?) -> [String] {
        let pokemonOptionalImages = [
            sprites?.other?.officialArtwork?.frontDefault,
            sprites?.backDefault,
            sprites?.backFemale,
            sprites?.backShiny,
            sprites?.backShinyFemale,
            sprites?.frontFemale,
            sprites?.frontShiny,
            sprites?.frontShinyFemale,
            sprites?.other?.dreamWorld?.frontDefault,
            sprites?.other?.dreamWorld?.frontFemale
        ]
        var pokemonImages:[String] = []
        for image in pokemonOptionalImages  {
            if let img = image { pokemonImages.append(img) }
        }
        return pokemonImages
    }
    private func getStatDict(statsArray: [Stat]?) -> [PokemonStatEntity] {
        var statsEntityArray: [PokemonStatEntity] = []
        if let stats = statsArray {
            for stat in stats {
                // devidev by 100 for progressview
                statsEntityArray.append(
                    PokemonStatEntity(name: stat.stat.name,
                                      value: String(stat.baseStat),
                                      percentage: Float(Float(stat.baseStat) / Float(100)))
                )
                
            }
        }
        return statsEntityArray
    }
    
    private func getTypes(types: [TypeElement]?)->[Asset] {
        var elementsArray: [Asset] = []
        if let elements = types {
            for type in elements {
                if let asset = Asset(rawValue: type.type.name) {
                    elementsArray.append(asset)
                }
            }
        }
        return elementsArray
    }
}





