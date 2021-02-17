//
//  StatsCollectionView.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 17/02/2021.
//

import Foundation
import SnapKit
import UIKit

final class StatsCollectionView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionView : UICollectionView?
    let cellSpacing:CGFloat = 2
    
    var datasource: [PokemonStatEntity] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(datasource: [PokemonStatEntity]) {
        super.init(frame: .zero)
        self.datasource = datasource
        setCollectionView()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCollectionView() {
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
        
        collectionView!.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(collectionView!)
        collectionView!.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalTo(self)
        }
        collectionView?.backgroundView = UIView(frame: collectionView!.bounds)
        collectionView!.backgroundColor = .white
        
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionView!.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionViewFlowLayout.minimumLineSpacing = 0
        collectionViewFlowLayout.minimumInteritemSpacing = 0
        
        collectionView?.isPagingEnabled = true
        collectionView?.bounces = false
        
        collectionView!.register(StatsCollectionViewCell.self, forCellWithReuseIdentifier: StatsCollectionViewCell.cellId)
        collectionView!.delegate = self
        collectionView!.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.datasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StatsCollectionViewCell.cellId, for: indexPath) as! StatsCollectionViewCell
    
        cell.progressView.progress = self.datasource[indexPath.item].percentage
        cell.statName.text = self.datasource[indexPath.item].name
        cell.statValue.text = self.datasource[indexPath.item].value
        return cell
    }
    


    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.frame.width)
        let height = CGFloat(80)
        return CGSize(width: width, height: height)
    }
}
