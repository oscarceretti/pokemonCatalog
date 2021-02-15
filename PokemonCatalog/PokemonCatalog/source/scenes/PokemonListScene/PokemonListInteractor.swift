//
//  PokemonListInteractor.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 15/02/2021.
//

import Foundation
final class PokemonListInteractor {
    typealias Dependencies = HasPokemonManager
    let dependencies: Dependencies
    
    private var pokeData: PokemonList?
    
    init (dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    deinit{}
    
    func getPokemonEntity(completion: @escaping ([Pokemon]?,Error?) -> ()){
        var updatedPokemons: [Pokemon] = []
        self.dependencies.pokemonManager.getPokemonList(next: self.pokeData?.next) { (pokemonList,error) in
            let myGroup = DispatchGroup()
            self.pokeData = pokemonList
            if let data = pokemonList {
                for pokemon in data.results {
                    myGroup.enter()

                    self.dependencies.pokemonManager.getPokemonDetail(urlString: pokemon.url) { (pokemonDetail) in
                        var sprite: String = ""
                        if let front = pokemonDetail.sprites?.frontDefault {
                            sprite = front
                        } else if let frontShiny = pokemonDetail.sprites?.frontShiny{
                            sprite = frontShiny
                        } else if let official = pokemonDetail.sprites?.other?.officialArtwork?.frontDefault {
                            sprite = official
                        }
                        let newPokemonData = Pokemon(name: pokemon.name, url: pokemon.url, sprite: sprite)
                        if !sprite.isEmpty{
                            updatedPokemons.append(newPokemonData)
                        }
                        myGroup.leave()
                    }
                }
               
                myGroup.notify(queue: .main) {
                    completion(updatedPokemons,error)
                }
                
            }else {
                completion(nil,error)
            }
        }
    }
}


