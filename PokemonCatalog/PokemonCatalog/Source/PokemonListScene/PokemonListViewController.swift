//
//  PokemonListViewController.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 09/02/2021.
//

import UIKit
import SnapKit
class PokemonListViewController: UIViewController {
    
    private var viewModel: PokemonListViewModel
    
    private var pokemonList = PokemonListCollectionView(datasource: [])
    
    init(viewModel: PokemonListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.view.addSubview(pokemonList)
        pokemonList.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callToViewModelForUIUpdate()
        self.viewModel.callFuncToGetPokemonList()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        callToViewModelForUIUpdate()
    }
    
    func callToViewModelForUIUpdate() {
        self.viewModel.bindPokemonListViewModelToController = {
            self.updateDatasource()
        }
    }
    
    func updateDatasource() {
        if let pokedata = self.viewModel.pokeData {
            DispatchQueue.main.async {
                self.pokemonList.datasource = pokedata.results
                self.pokemonList.collectionView?.reloadData()
            }
        }
    }
    
}

