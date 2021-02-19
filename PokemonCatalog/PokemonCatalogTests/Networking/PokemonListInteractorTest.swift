//
//  PokemonListInteractorTest.swift
//  PokemonCatalogTests
//
//  Created by Oscar Ceretti on 19/02/2021.
//

import XCTest
@testable import PokemonCatalog
class PokemonListInteractorTest: XCTestCase {
    
    var sut: PokemonListInteractor!
    
    override func setUp() {
        super.setUp()
        sut = PokemonListInteractor(dependencies: AppDependencies())
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_get_list() {
        var receivedPokemons: [PokemonEntity]? = nil
        var receivedError: String? = nil
        
        sut.getPokemonEntity { (pokemons, error) in
            receivedPokemons = pokemons
            receivedError = error
            XCTAssertTrue(!receivedPokemons!.isEmpty)
            XCTAssertNil(receivedError)
        }
  
    }
   
    
}


