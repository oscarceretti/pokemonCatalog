//
//  StatsCollectionViewCell.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 17/02/2021.
//

import Foundation
import UIKit
import SnapKit

class StatsCollectionViewCell: UICollectionViewCell {
    
    static let cellId = "__"

    var statName = UILabel(frame: .zero).then {
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        $0.textColor = .black
    }
    var statValue = UILabel(frame: .zero).then {
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        $0.textColor = .black
    }
    var progressView = UIProgressView(frame: .zero).then {
        $0.tintColor = UIColor.systemTeal
        $0.progressViewStyle = .default
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    func setupViews(){
        
        addSubview(statName)
        statName.translatesAutoresizingMaskIntoConstraints = false
        let nameConstraints = [
            statName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            statName.topAnchor.constraint(equalTo: topAnchor,constant: 10),
        ]
        NSLayoutConstraint.activate(nameConstraints)
        

        addSubview(statValue)
        statValue.translatesAutoresizingMaskIntoConstraints = false
        let valueConstraints = [
            statValue.leadingAnchor.constraint(equalTo: statName.trailingAnchor, constant: 10),
            statValue.centerYAnchor.constraint(equalTo: statName.centerYAnchor)
        ]
        NSLayoutConstraint.activate(valueConstraints)
        
        addSubview(progressView)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        let progressConstraints = [
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            progressView.topAnchor.constraint(equalTo: statName.bottomAnchor, constant: 20),
            progressView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ]
        NSLayoutConstraint.activate(progressConstraints)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
