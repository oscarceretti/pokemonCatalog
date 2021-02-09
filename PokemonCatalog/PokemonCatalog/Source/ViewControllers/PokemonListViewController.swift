//
//  PokemonListViewController.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 09/02/2021.
//

import UIKit

class PokemonListViewController: UIViewController {

    private var pokemonListViewModel: PokemonListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callToViewModelForUpdateUIUpdate()
        // Do any additional setup after loading the view.
    }

    func callToViewModelForUpdateUIUpdate() {
        self.pokemonListViewModel = PokemonListViewModel()
    }

}

