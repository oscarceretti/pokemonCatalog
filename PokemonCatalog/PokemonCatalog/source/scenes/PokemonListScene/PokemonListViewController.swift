//
//  PokemonListViewController.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 09/02/2021.
//

import UIKit


class PokemonListViewController: UIViewController {
    
    private let viewModel: PokemonListViewModel
    private let router: PokemonListRouter
    
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
        pokemonList.delegate = self
        callToViewModelForUIUpdate()
        self.viewModel.callFuncToGetPokemonList()
    }
    
    
    func callToViewModelForUIUpdate() {
        
        self.viewModel.bindPokemonListViewModelToController = { datasource in
            DispatchQueue.main.async {
                self.pokemonList.datasource.append(contentsOf: datasource)
                self.pokemonList.collectionView?.reloadData()
            }
        }
        
        self.viewModel.bindErrorViewModelToController = {error in
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Ops", message: error, preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
                    alert.dismiss(animated: true)
                })
                alert.addAction(action)
                self.present(alert, animated: true)
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
