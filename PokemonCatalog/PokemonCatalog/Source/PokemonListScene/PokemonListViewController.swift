//
//  PokemonListViewController.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 09/02/2021.
//

import UIKit
import SnapKit
class PokemonListViewController: UIViewController {
    
    var pokemonList = PokemonListCollectionView(datasource: [])
    private var pokemonListViewModel: PokemonListViewModel
    //private var dataSource : EmployeeTableViewDataSource<EmployeeTableViewCell,EmployeeData>!
    init(pokemonListViewModel: PokemonListViewModel) {
        self.pokemonListViewModel = pokemonListViewModel
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
        self.pokemonListViewModel.callFuncToGetPokemonList()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        callToViewModelForUIUpdate()
    }
    func callToViewModelForUIUpdate() {
        self.pokemonListViewModel.bindPokemonListViewModelToController = {
            self.updateDatasource()
        }
    }
    
    func updateDatasource() {
        if let pokedata = self.pokemonListViewModel.pokeData {
            DispatchQueue.main.async {
                self.pokemonList.datasource = pokedata.results
                self.pokemonList.collectionView?.reloadData()
            }
        }
        
    }
    
}

