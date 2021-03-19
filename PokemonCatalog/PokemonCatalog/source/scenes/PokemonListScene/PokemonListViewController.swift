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
    private var activityIndicator = UIActivityIndicatorView(style: .white) {
        didSet {
            activityIndicator.backgroundColor = .systemBlue
            activityIndicator.layer.cornerRadius = 20
        }
        
    }
    
    init(viewModel: PokemonListViewModel, router: PokemonListRouter) {
        self.viewModel = viewModel
        self.router = router
        super.init(nibName: nil, bundle: nil)
        
        self.view.backgroundColor = .white
        self.view.addSubview(pokemonList)
        pokemonList.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            pokemonList.topAnchor.constraint(equalTo: view.topAnchor),
            pokemonList.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pokemonList.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pokemonList.bottomAnchor.constraint(equalTo: view.bottomAnchor)
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
        pokemonList.delegate = self
        callToViewModelForUIUpdate()
        self.viewModel.callFuncToGetPokemonList()
        self.title = "Lista"
    }
    
    
    func callToViewModelForUIUpdate() {
        
        self.viewModel.bindPokemonListViewModelToController = { [weak self] datasource in
            DispatchQueue.main.async {
                self?.pokemonList.datasource.append(contentsOf: datasource)
                self?.pokemonList.collectionView?.reloadData()
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
                self?.pokemonList.isUserInteractionEnabled = !loading
                if loading {
                    self?.activityIndicator.startAnimating()
                } else {
                    self?.activityIndicator.stopAnimating()
                }
            }
        }
        
    }
    
}

extension PokemonListViewController: PokemonListCollectionViewDelegate {
    func openDetail(pokemonName: String) {
        self.router.openPokemonDetail(from: self, pokemonName: pokemonName)
    }
    
    func askForMore() {
        self.viewModel.callFuncToGetPokemonList()
    }
    
    
}

