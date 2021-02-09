//
//  APIService.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 09/02/2021.
//

import Foundation

class APIService: NSObject {
    private let sourceURL = URL(string: "https://pokeapi.co/api/v2/pokemon?offset=0")
    
    func getPokemonList(completion: @escaping (PokemonList) -> ()) {
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
