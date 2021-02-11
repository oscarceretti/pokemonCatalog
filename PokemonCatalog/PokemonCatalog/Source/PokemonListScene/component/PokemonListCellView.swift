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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    

    
    func setupViews(){
        
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
