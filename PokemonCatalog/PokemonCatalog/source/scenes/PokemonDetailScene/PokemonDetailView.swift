//
//  PokemonDetailView.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 17/02/2021.
//

import Foundation
import UIKit

final class PokemonDetailView: UIView {
    let scrollview = UIScrollView(frame: .zero)
    let pokemonName = UILabel(frame: .zero).then {
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        $0.textColor = .black
    }
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.setLayout()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension PokemonDetailView {
    
    func setLayout(){
        addSubview(scrollview)
        scrollview.snp.remakeConstraints { (make) in
            make.edges.equalTo(self)
        }
        self.addSubview(pokemonName)
        pokemonName.snp.remakeConstraints { (make) in
            make.top.equalTo(self).offset(40)
            make.leading.equalTo(self).offset(45)
            make.trailing.equalTo(self).offset(-45)
        }
    }
    
}
