//
//  PokemonDetailInteractor.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 16/02/2021.
//

import Foundation
protocol PokemonDetailInteractorInterface {
    func getPokemonDetail(completion: @escaping (String?, [String], [String:Int], [Asset], Error?) -> ())
}

final class PokemonDetailInteractor: PokemonDetailInteractorInterface {
    
    typealias Dependencies = HasPokemonManager
    let dependencies: Dependencies
    let pokemonUrl: String
    private var pokeData: PokemonList?
    
    init (dependencies: Dependencies, pokemonUrl: String) {
        self.dependencies = dependencies
        self.pokemonUrl = pokemonUrl
    }
    
    deinit{}
    
    func getPokemonDetail(completion: @escaping (String?, [String], [String:Int], [Asset], Error?) -> ()) {
        self.dependencies.pokemonManager.getPokemonDetail(urlString: pokemonUrl) { (pokemonDetail, error) in
            
            self.getTypes(types: pokemonDetail?.types)
            completion(
                pokemonDetail?.name,
                self.getImages(sprites: pokemonDetail?.sprites),
                self.getStatDict(statsArray: pokemonDetail?.stats),
                self.getTypes(types: pokemonDetail?.types),
                error)
        }
    }
    
    
    private func getImages(sprites: Sprites?) -> [String] {
        let pokemonOptionalImages = [
              sprites?.other?.officialArtwork?.frontDefault,
              sprites?.backDefault,
              sprites?.backFemale,
              sprites?.backShiny,
              sprites?.backShinyFemale,
              sprites?.frontFemale,
              sprites?.frontShiny,
              sprites?.frontShinyFemale
          
          ]
          var pokemonImages:[String] = []
          for image in pokemonOptionalImages  {
              if let img = image { pokemonImages.append(img) }
          }
        return pokemonImages
    }
    private func getStatDict(statsArray: [Stat]?) -> [String: Int] {
        var statsDictionary: [String: Int] = [:]
        if let stats = statsArray {
            for stat in stats {
                statsDictionary[stat.stat.name] = stat.baseStat
            }
        }
        return statsDictionary
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





