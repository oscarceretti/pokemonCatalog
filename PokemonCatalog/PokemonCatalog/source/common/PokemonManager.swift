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
    func getPokemonList(next: String?,completion: @escaping (Result<PokemonList>) -> ())
    func getPokemonDetail(pokemonName: String,completion: @escaping (Result<PokemonDetail>) -> ())
}
class PokemonManager: NSObject, PokemonManagerProtocol{
    
    
    override init() {
        super.init()
        
    }
    func getPokemonList(next: String?,completion: @escaping (Result<PokemonList>) -> ()) {
        
        RechabilityHandler().start { (rechability) in
            guard  rechability == true else { return completion(.failure(MyError.network)) }
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
                    completion(.success(pokeData))
                }
            }catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
    
    func getPokemonDetail(pokemonName: String,completion: @escaping (Result<PokemonDetail>) -> ()) {
        
        RechabilityHandler().start { (rechability) in
            guard  rechability == true else { return completion(.failure(MyError.network)) }
        }
        
        let sourceURL = URL(string: pokemonName)
        guard let url = sourceURL else { return }
        URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            do {
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    let pokeData = try jsonDecoder.decode(PokemonDetail.self, from: data)
                    completion(.success(pokeData))
                }
            }catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
}
