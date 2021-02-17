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
    
    let pokemonImage = UIImageView(frame: .zero).then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds  = true
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    func setupViews(){
        self.addSubview(pokemonImage)
        self.pokemonImage.snp.remakeConstraints { (make) in
            make.edges.equalTo(self)
        }
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
