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
    private var router: PokemonListRouter
    private var pokemonList = PokemonListCollectionView(datasource: [])
    
    init(viewModel: PokemonListViewModel, router: PokemonListRouter) {
        self.viewModel = viewModel
        self.router = router
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
        pokemonList.delegate = self
        self.viewModel.callFuncToGetPokemonList()
    }
    
    
    func callToViewModelForUIUpdate() {
        self.viewModel.bindPokemonListViewModelToController = {
            self.updateDatasource()
        }
    }
    
    func updateDatasource() {
        if let pokedata = self.viewModel.pokeData {
            DispatchQueue.main.async {
                self.pokemonList.datasource.append(contentsOf: pokedata.results)
                self.pokemonList.collectionView?.reloadData()
            }
        }
    }
    
}

extension PokemonListViewController: PokemonListCollectionViewDelegate {
    func openDetail(urlString: String) {
        self.router.openPokemonDetail(from: self, pokemonUrl: urlString)
    }
    

    
    func askForMore() {
        self.viewModel.callFuncToGetPokemonList()
    }
    
    
}
