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
    func getPokemonList(next: String?,completion: @escaping (PokemonList) -> ())
}
class PokemonManager: NSObject, PokemonManagerProtocol{
    
    
    func getPokemonList(next: String?,completion: @escaping (PokemonList) -> ()) {
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
                    completion(pokeData)
                }
            }catch {
                debugPrint("bad", error.localizedDescription)
            }
           
            
        }.resume()
    }
}