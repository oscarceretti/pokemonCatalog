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
    let pokemonCarusel = PokemonCaruselView(datasource: [])
    let typesCollection = PokenTypeCollectionView(datasource: [])
    let statsCollection = StatsCollectionView(datasource: [])
    
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
            make.edges.equalTo(self.safeAreaInsets)
            
        }
        scrollview.addSubview(pokemonName)
        pokemonName.snp.remakeConstraints { (make) in
            make.top.equalTo(scrollview).offset(20)
            make.leading.equalTo(self).offset(45)
            make.trailing.equalTo(self).offset(-45)
        }
        scrollview.addSubview(pokemonCarusel)
        pokemonCarusel.snp.remakeConstraints { (make) in
            make.top.equalTo(pokemonName.snp.bottom).offset(20)
            make.width.height.equalTo(self.snp.width)
        }
        scrollview.addSubview(typesCollection)
        typesCollection.snp.remakeConstraints { (make) in
            make.top.equalTo(pokemonCarusel.snp.top).offset(20)
            make.trailing.equalTo(self).offset(-10)
            make.width.equalTo(50)
            make.height.equalTo(self.pokemonCarusel.snp.height)
        }
        scrollview.addSubview(statsCollection)
        statsCollection.snp.remakeConstraints { (make) in
            make.top.equalTo(pokemonCarusel.snp.bottom).offset(20)
            make.leading.trailing.equalTo(scrollview)
            make.width.equalTo(self)
            make.height.equalTo(480)
            make.bottom.equalTo(scrollview).offset(-60)
        }
        
    }
    
}
