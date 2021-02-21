//
//  APIService.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 09/02/2021.
//

import Foundation
import SystemConfiguration
enum MyError: Error {
    case network
}
protocol HasPokemonManager {
    var pokemonManager: PokemonManagerProtocol { get }
}

protocol PokemonManagerProtocol {
    func getPokemonList(next: String?,completion: @escaping (PokemonList?,Error?) -> ())
    func getPokemonDetail(pokemonName: String,completion: @escaping (PokemonDetail?, Error?) -> ())
}
class PokemonManager: NSObject, PokemonManagerProtocol{
    
    
    override init() {
        super.init()
        
    }
    func getPokemonList(next: String?,completion: @escaping (PokemonList?,Error?) -> ()) {
        
        RechabilityHandler().start { (rechability) in
            guard  rechability == true else { return completion(nil, MyError.network) }
        }
        
        var sourceURL: URL?
        if let nextString = next {
            sourceURL = URL(string: nextString)
        }else {
            sourceURL = URL(string: Constants.urlPath.pokemonList)
        }
        guard let url = sourceURL else { return }
        URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            do {
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    let pokeData = try jsonDecoder.decode(PokemonList.self, from: data)
                    completion(pokeData, nil)
                }
            }catch {
                completion(nil, error)
            }
            
        }.resume()
    }
    
    func getPokemonDetail(pokemonName: String,completion: @escaping (PokemonDetail?, Error?) -> ()) {
        
        RechabilityHandler().start { (rechability) in
            guard  rechability == true else { return completion(nil, MyError.network) }
        }
        
        let sourceURL = URL(string: pokemonName)
        guard let url = sourceURL else { return }
        URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            do {
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    let pokeData = try jsonDecoder.decode(PokemonDetail.self, from: data)
                    completion(pokeData,nil)
                }
            }catch {
                completion(nil, error)
            }
        }.resume()
    }
    
}
