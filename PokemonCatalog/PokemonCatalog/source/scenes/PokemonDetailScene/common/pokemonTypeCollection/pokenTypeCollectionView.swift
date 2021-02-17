//
//  PokenTypeCollectionView.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 17/02/2021.
//

import Foundation
import UIKit
import SnapKit
final class PokenTypeCollectionView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionView : UICollectionView?
    let cellSpacing:CGFloat = 2
    
    var datasource: [Asset] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(datasource: [Asset]) {
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
        collectionView!.backgroundColor = .clear
        
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionView!.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionViewFlowLayout.minimumLineSpacing = 10
        collectionViewFlowLayout.minimumInteritemSpacing = 10
        
        collectionView?.isPagingEnabled = true
        collectionView?.bounces = false
        
        collectionView!.register(PokemonTypeCollectionViewCell.self, forCellWithReuseIdentifier: PokemonTypeCollectionViewCell.cellId)
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonTypeCollectionViewCell.cellId, for: indexPath) as! PokemonTypeCollectionViewCell
        
        if indexPath.item < (datasource.count) {
            cell.pokemonImage.image = UIImage(asset: self.datasource[indexPath.item])
        }
        
        return cell
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = 50
        let height = 50
        return CGSize(width: width, height: height)
    }
}

