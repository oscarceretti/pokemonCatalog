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
    
   
    
    init(viewModel: PokemonDetailViewModel, router: PokemonDetailRouter) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    

    
}
