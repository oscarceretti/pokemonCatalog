//
//  PokemonCaruselCellView.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 17/02/2021.
//

import Foundation
import UIKit

class PokemonCaruselCellView: UICollectionViewCell {
    
    static let cellId = "PokemonCaruselCellView__"
    
    var pokemonImage = UIImageView(frame: .zero) {
        didSet{
            pokemonImage.contentMode = .scaleAspectFill
            pokemonImage.clipsToBounds  = true
        }
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    func setupViews(){
        
        self.addSubview(pokemonImage)
        pokemonImage.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            pokemonImage.topAnchor.constraint(equalTo: topAnchor),
            pokemonImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            pokemonImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            pokemonImage.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
