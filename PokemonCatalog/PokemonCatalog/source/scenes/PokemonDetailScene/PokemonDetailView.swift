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
        
        self.addSubview(scrollview)
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        let scrollConstraints = [
            scrollview.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollview.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollview.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scrollview.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(scrollConstraints)
        
        scrollview.addSubview(pokemonName)
        pokemonName.translatesAutoresizingMaskIntoConstraints = false
        let nameConstraints = [
            pokemonName.topAnchor.constraint(equalTo: scrollview.topAnchor, constant: 20),
            pokemonName.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor, constant: 40),
            pokemonName.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor, constant: -45)
        ]
        NSLayoutConstraint.activate(nameConstraints)
        
        scrollview.addSubview(pokemonCarusel)
        pokemonCarusel.translatesAutoresizingMaskIntoConstraints = false
        let caruselConstraints = [
            pokemonCarusel.topAnchor.constraint(equalTo: pokemonName.bottomAnchor, constant: 20),
            pokemonCarusel.widthAnchor.constraint(equalTo: widthAnchor),
            pokemonCarusel.heightAnchor.constraint(equalTo: widthAnchor)
        ]
        NSLayoutConstraint.activate(caruselConstraints)
        
        

        scrollview.addSubview(typesCollection)
        typesCollection.translatesAutoresizingMaskIntoConstraints = false
        let typesConstraints = [
            typesCollection.topAnchor.constraint(equalTo: pokemonCarusel.topAnchor, constant: 20),
            typesCollection.widthAnchor.constraint(equalToConstant: 50),
            typesCollection.heightAnchor.constraint(equalTo: pokemonCarusel.heightAnchor),
            typesCollection.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ]
        NSLayoutConstraint.activate(typesConstraints)

        scrollview.addSubview(statsCollection)
        statsCollection.translatesAutoresizingMaskIntoConstraints = false
        let statsConstraints = [
            statsCollection.topAnchor.constraint(equalTo: pokemonCarusel.bottomAnchor, constant: 20),
            statsCollection.leadingAnchor.constraint(equalTo: leadingAnchor),
            statsCollection.trailingAnchor.constraint(equalTo: trailingAnchor),
            statsCollection.heightAnchor.constraint(equalToConstant: 480),
            statsCollection.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor, constant: -60)
        ]
        NSLayoutConstraint.activate(statsConstraints)
        
    }
    
}
