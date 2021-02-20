//
//  PokemonTypeCollectionViewCell.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 17/02/2021.
//

import Foundation
import UIKit
import SnapKit

class PokemonTypeCollectionViewCell: UICollectionViewCell {
    
    static let cellId = "PokemonTypeCollectionViewCell__"
    
    let pokemonImage = UIImageView(frame: .zero).then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds  = true
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
        self.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

