//
//  StatsCollectionViewCell.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 17/02/2021.
//

import Foundation
import UIKit

class StatsCollectionViewCell: UICollectionViewCell {
    
    static let cellId = "StatsCollectionViewCell__"

    var statName = UILabel(frame: .zero) {
        didSet {
            statName.textAlignment = .left
            statName.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
            statName.textColor = .black
        }
    }
    var statValue = UILabel(frame: .zero) {
        didSet {
            statValue.textAlignment = .left
            statValue.font = UIFont.systemFont(ofSize: 18, weight: .regular)
            statValue.textColor = .black
        }
    }
    var progressView = UIProgressView(frame: .zero) {
        didSet {
            progressView.tintColor = UIColor.systemTeal
            progressView.progressViewStyle = .default
        }
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
