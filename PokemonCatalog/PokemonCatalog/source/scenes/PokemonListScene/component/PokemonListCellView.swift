//
//  PokemonListCellView.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 11/02/2021.
//

import Foundation
import UIKit

class PokemonListCellView: UICollectionViewCell {
    
    static let cellId = "pokemonListCellView__"
    let pokemonName = UILabel(frame: .zero).then {
        $0.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        $0.textAlignment = .center
        $0.textColor = .black
        $0.adjustsFontSizeToFitWidth = true
    }
    let pokemonImage = UIImageView(frame: .zero).then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds  = true
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    func setupViews(){
        self.addSubview(pokemonName)
        self.addSubview(pokemonImage)
       
        pokemonImage.translatesAutoresizingMaskIntoConstraints = false
        let imageConstraints = [
            pokemonImage.topAnchor.constraint(equalTo: topAnchor),
            pokemonImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            pokemonImage.heightAnchor.constraint(equalToConstant: 100),
            pokemonImage.widthAnchor.constraint(equalToConstant: 100)
        ]
        NSLayoutConstraint.activate(imageConstraints)
        
        pokemonName.translatesAutoresizingMaskIntoConstraints = false
        let nameConstraints = [
            pokemonName.topAnchor.constraint(equalTo: pokemonImage.bottomAnchor,constant: 5),
            pokemonName.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            pokemonName.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            pokemonName.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        NSLayoutConstraint.activate(nameConstraints)
        
        self.backgroundColor = .white
        self.layer.cornerRadius = 20
        self.elevate(elevation:3)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
