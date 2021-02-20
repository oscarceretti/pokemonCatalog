//
//  PokemonDetailViewController.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 13/02/2021.
//

import Foundation
import UIKit


class PokemonDetailViewController: UIViewController {
    
    private var viewModel: PokemonDetailViewModel
    private var mainView = PokemonDetailView()
    private var activityIndicator = UIActivityIndicatorView(style: .white).then {
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 20
    }
    
    init(viewModel: PokemonDetailViewModel, router: PokemonDetailRouter) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.title = "Dettaglio"
        self.view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        
        self.view.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        let activityConstraints = [
            activityIndicator.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            activityIndicator.widthAnchor.constraint(equalToConstant: 50),
            activityIndicator.heightAnchor.constraint(equalToConstant: 50)
        ]
        NSLayoutConstraint.activate(activityConstraints)

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
        
        self.viewModel.bindPokemonNameToController = { [weak self] name in
            DispatchQueue.main.async {
                self?.mainView.pokemonName.text = name
            }
        }
        
        self.viewModel.bindPokemonImagesToController = { [weak self] sprites in
            DispatchQueue.main.async {
                self?.mainView.pokemonCarusel.datasource = sprites
                self?.mainView.pokemonCarusel.collectionView?.reloadData()
            }
        }
        
        self.viewModel.bindPokemonStatToController = { [weak self] stats in
            DispatchQueue.main.async {
                self?.mainView.statsCollection.datasource = stats
                self?.mainView.statsCollection.collectionView?.reloadData()
                
            }
        }
        
        self.viewModel.bindPokemonTypeToController = { [weak self] types in
            DispatchQueue.main.async {
                self?.mainView.typesCollection.datasource = types
                self?.mainView.typesCollection.collectionView?.reloadData()
            }
        }
        
        self.viewModel.bindErrorViewModelToController = { [weak self] error in
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Ops", message: error, preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
                    alert.dismiss(animated: true)
                })
                alert.addAction(action)
                self?.present(alert, animated: true)
            }
        }
        
        self.viewModel.bindLoadingViewModelToController = { [weak self] loading in
            DispatchQueue.main.async {
                if loading {
                    self?.activityIndicator.startAnimating()
                } else {
                    self?.activityIndicator.stopAnimating()
                }
            }
        }
        
        
    }
    
}


