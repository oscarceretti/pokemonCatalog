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
        statName.snp.remakeConstraints { (make) in
            make.leading.equalTo(self).offset(40)
            make.top.equalTo(self).offset(10)
        }
        addSubview(statValue)
        statValue.snp.remakeConstraints { (make) in
            make.leading.equalTo(statName.snp.trailing).offset(10)
            make.centerY.equalTo(statName)
        }
        
        addSubview(progressView)
        progressView.snp.remakeConstraints { (make) in
            make.leading.equalTo(self).offset(40)
            make.trailing.equalTo(self).offset(-40)
            make.top.equalTo(statName.snp.bottom).offset(20)
            make.bottom.equalTo(self).offset(-10)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
