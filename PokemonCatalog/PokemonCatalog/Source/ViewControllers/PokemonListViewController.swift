//
//  PokemonListViewController.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 09/02/2021.
//

import UIKit

class PokemonListViewController: UIViewController {

    private var pokemonListViewModel: PokemonListViewModel
   
    init(pokemonListViewModel: PokemonListViewModel) {
        self.pokemonListViewModel = pokemonListViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        callToViewModelForUpdateUIUpdate()
        // Do any additional setup after loading the view.
    }

    func callToViewModelForUpdateUIUpdate() {
        self.pokemonListViewModel.callFuncToGetPokemonList()
    }

}

