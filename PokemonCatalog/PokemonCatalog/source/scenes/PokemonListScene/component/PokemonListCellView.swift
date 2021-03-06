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
    var pokemonName = UILabel(frame: .zero) {
        didSet {
            pokemonName.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
            pokemonName.textAlignment = .center
            pokemonName.textColor = .black
            pokemonName.adjustsFontSizeToFitWidth = true
        }
    }
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
            pokemonName.centerXAnchor.constraint(equalTo: self.centerXAnchor),
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
