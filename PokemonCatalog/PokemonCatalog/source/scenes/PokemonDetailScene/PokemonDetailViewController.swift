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
        
        self.viewModel.bindPokemonNameToController = { name in
            DispatchQueue.main.async {
                self.mainView.pokemonName.text = name
            }
        }
        
        self.viewModel.bindPokemonImagesToController = { sprites in
            DispatchQueue.main.async {
                self.mainView.pokemonCarusel.datasource = sprites
                self.mainView.pokemonCarusel.collectionView?.reloadData()
            }
        }
        
        self.viewModel.bindPokemonStatToController = { stats in
            DispatchQueue.main.async {
                self.mainView.statsCollection.datasource = stats
                self.mainView.statsCollection.collectionView?.reloadData()
                
            }
        }
        
        self.viewModel.bindPokemonTypeToController = { types in
            DispatchQueue.main.async {
                self.mainView.typesCollection.datasource = types
                self.mainView.typesCollection.collectionView?.reloadData()
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


