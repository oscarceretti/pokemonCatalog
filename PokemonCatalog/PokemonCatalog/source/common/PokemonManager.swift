//
//  APIService.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 09/02/2021.
//

import Foundation
protocol HasPokemonManager {
    var pokemonManager: PokemonManagerProtocol { get }
}

protocol PokemonManagerProtocol {
    func getPokemonList(next: String?,completion: @escaping (PokemonList?,Error?) -> ())
    func getPokemonDetail(urlString: String,completion: @escaping (PokemonDetail) -> ())
}
class PokemonManager: NSObject, PokemonManagerProtocol{
    
    
    func getPokemonList(next: String?,completion: @escaping (PokemonList?,Error?) -> ()) {
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
                // TO-DO: Handle error
                completion(nil, error)
                debugPrint(error.localizedDescription)
            }
           
            
        }.resume()
    }
    
    func getPokemonDetail(urlString: String,completion: @escaping (PokemonDetail) -> ()) {
        let sourceURL = URL(string: urlString)
        guard let url = sourceURL else { return }
        URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            do {
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    let pokeData = try jsonDecoder.decode(PokemonDetail.self, from: data)
                    completion(pokeData)
                }
            }catch {
                // TO-DO: Handle error
                debugPrint(error.localizedDescription)
            }
           
            
        }.resume()
    }
    
}
