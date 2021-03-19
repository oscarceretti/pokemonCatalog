//
//  PokemonListInteractor.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 15/02/2021.
//

import Foundation

protocol PokemonListInteractorInterface {
    func getPokemonEntity(completion: @escaping (Result<[PokemonEntity]>) -> ())
}

final class PokemonListInteractor: PokemonListInteractorInterface {
    typealias Dependencies = HasPokemonManager
    let dependencies: Dependencies
    
    private var pokeData: PokemonList?
    private var totalCount: Int? = nil
    init (dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    deinit{}
    

    func getPokemonEntity(completion: @escaping (Result<[PokemonEntity]>) -> ()){
        var updatedPokemons: [PokemonEntity] = []
        self.dependencies.pokemonManager.getPokemonList(next: self.pokeData?.next) { result in
            switch result {
            
            case .success(let pokemonList):
                if self.totalCount == nil { self.totalCount = pokemonList.count }
                if let total = self.totalCount, total > 0 {
                    let myGroup = DispatchGroup()
                    self.pokeData = pokemonList
                    if pokemonList.results.count > 0 {
                        for pokemon in pokemonList.results {
                            myGroup.enter()
                            
                            self.dependencies.pokemonManager.getPokemonDetail(pokemonName: pokemon.url) { result in
                                
                                switch result {
                                
                                case .success(let detail):
                                    
                                    var sprite: String = ""
                                    if let front = detail.sprites?.frontDefault {
                                        sprite = front
                                    } else if let frontShiny = detail.sprites?.frontShiny{
                                        sprite = frontShiny
                                    } else if let official = detail.sprites?.other?.officialArtwork?.frontDefault {
                                        sprite = official
                                    }
                                    
                                    if !sprite.isEmpty, let url = URL(string: sprite){
                                        let newPokemonData = PokemonEntity(name: pokemon.name, sprite: url)
                                        updatedPokemons.append(newPokemonData)
                                    }
                                    myGroup.leave()
                                    
                                    self.totalCount! -= 1
                                    
                                case .failure(let error):
                                    self.totalCount! -= 1
                                    myGroup.leave()
                                }
                                
                            }
                            
                        }
                        
                        myGroup.notify(queue: .main) {
                        debugPrint("Pokemon left = \(self.totalCount)")
                            completion(.success(updatedPokemons))
                        }
                    }else {
                        completion(.success([]))
                    }
                    
                }else {
                    completion(.success([]))
                }
                
            case .failure(let error):
                debugPrint(error.localizedDescription)
                completion(.failure(error))
            }

        }
    }
    
}


