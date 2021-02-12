//
//  PokemonListCellView.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 11/02/2021.
//

import Foundation
import UIKit
import SnapKit

class PokemonListCellView: UICollectionViewCell {
    
    static let cellId = "pokemonListCellView__"
    let pokemonName = UILabel(frame: .zero).then {
        $0.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        $0.textAlignment = .left
        $0.textColor = .black
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
       
        self.pokemonImage.snp.remakeConstraints { (make) in
            make.leading.equalTo(self).offset(20)
            make.centerY.equalTo(self)
            make.width.height.equalTo(40)
        }
        
        self.pokemonName.snp.remakeConstraints { (make) in
            make.leading.equalTo(pokemonImage.snp.trailing).offset(15)
            make.trailing.equalTo(self).offset(-20)
            make.centerY.equalTo(self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
