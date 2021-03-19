//
//  Result.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 19/03/2021.
//

import Foundation

enum Result<Value> {
    case success(Value)
    case failure (Error)
}

