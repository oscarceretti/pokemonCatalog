//
//  PokemonDetailViewController.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 13/02/2021.
//

import Foundation
import UIKit
import SnapKit

class PokemonDetailViewController: UIViewController {
    
    private var viewModel: PokemonDetailViewModel
    private var mainView = PokemonDetailView()
    
    
    init(viewModel: PokemonDetailViewModel, router: PokemonDetailRouter) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.view.addSubview(mainView)
        mainView.snp.remakeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callToViewModelForUIUpdate()
        self.viewModel.callFuncToGetPokemonDetail()
        self.view.backgroundColor = .white
    }
    
    
    func callToViewModelForUIUpdate() {
        
        self.viewModel.bindPokemonNameToController = {
            DispatchQueue.main.async {
                self.mainView.pokemonName.text = self.viewModel.pokemonName
            }
        }
        
        self.viewModel.bindPokemonImagesToController = {
            DispatchQueue.main.async {
                if let images = self.viewModel.pokemonImages {
                    self.mainView.pokemonCarusel.datasource = images
                    self.mainView.pokemonCarusel.collectionView?.reloadData()
                }
            }
        }
        
        self.viewModel.bindPokemonStatToController = {
            DispatchQueue.main.async {
                if let types = self.viewModel.pokemonType {
                    self.mainView.typesCollection.datasource = types
                    self.mainView.typesCollection.collectionView?.reloadData()
                }
            }
        }
        
        self.viewModel.bindPokemonTypeToController = {
            DispatchQueue.main.async {
                if let stats = self.viewModel.pokemonStat {
                    self.mainView.statsCollection.datasource = stats
                    self.mainView.statsCollection.collectionView?.reloadData()
                }
            }
        }
        
    }
    
}


