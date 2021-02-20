//
//  CompositionRootTest.swift
//  PokemonCatalogTests
//
//  Created by Oscar Ceretti on 20/02/2021.
//

import XCTest
@testable import PokemonCatalog
class CompositionRootTest: XCTestCase {
    
    var sut: CompositionRoot!
    
    override func setUp() {
        super.setUp()
        sut = CompositionRoot()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_build_pokemon_list_scene() {
        var vc: PokemonListViewController
        vc = sut.buildPokemonListScene()
        XCTAssertTrue(vc.isKind(of: PokemonListViewController.self))
    }
    
    func test_build_pokemon_detail_scene() {
        var vc: PokemonDetailViewController
        vc = sut.buildPokemonDetailScene(urlString: "ditto")
        XCTAssertTrue(vc.isKind(of: PokemonDetailViewController.self))
    }
    
}
