//
//  PokemonDetailInteractTest.swift
//  PokemonCatalogTests
//
//  Created by Oscar Ceretti on 19/02/2021.
//

import XCTest
@testable import PokemonCatalog
class PokemonDetailInteractorTest: XCTestCase {
    
    var sut: PokemonDetailInteractor!
    
    override func setUp() {
        super.setUp()
        sut = PokemonDetailInteractor(dependencies: AppDependencies(), pokemonName: "ditto")
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_get_detail() {
        var receivedPokemonName: String? = nil
        var receivedPokemonImages:[String] = []
        var receivedStatsArray:[PokemonStatEntity] = []
        var receivedTypes: [Asset] = []
        var receivedError: String? = nil
        sut.getPokemonDetail() { (pokemonName,pokemonImages,statsArray,types,error) in
            receivedPokemonName = pokemonName
            receivedPokemonImages = pokemonImages
            receivedStatsArray = statsArray
            receivedTypes = types
            receivedError = error
            XCTAssertTrue(receivedPokemonName != nil)
            XCTAssertTrue(!receivedPokemonImages.isEmpty)
            XCTAssertTrue(!receivedStatsArray.isEmpty)
            XCTAssertTrue(!receivedTypes.isEmpty)
            XCTAssertNil(receivedError)
        }
  
    }
   
    
}
