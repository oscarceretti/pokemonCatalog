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
        $0.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        $0.textAlignment = .center
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
            make.top.equalTo(self).offset(20)
            make.centerX.equalTo(self)
            make.width.height.equalTo(100)
        }
        
        self.pokemonName.snp.remakeConstraints { (make) in
            make.top.equalTo(pokemonImage.snp.bottom).offset(5)
            make.leading.equalTo(self).offset(20)
            make.trailing.equalTo(self).offset(-20)
            make.bottom.equalTo(self).offset(-20)
        }
        self.backgroundColor = .white
        self.layer.cornerRadius = 20
        self.elevate(elevation:3)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
