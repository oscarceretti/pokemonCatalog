//
//  PokemonListCollectionView.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 11/02/2021.
//

import Foundation
import Foundation
import UIKit
import SnapKit


final class PokemonListCollectionView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionView : UICollectionView?
    
    var datasource: [Pokemon] = []
    var indexPath : IndexPath? = nil
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(datasource: [Pokemon]) {
        super.init(frame: .zero)
        self.datasource = datasource
        
        setCollectionView()
    }
    
    func scrollToIndexPath() {
        guard let index = indexPath else { return  }
        guard let coll = collectionView else { return  }
        DispatchQueue.main.async {
            coll.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
        }
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
        collectionViewFlowLayout.minimumLineSpacing = 2
        collectionViewFlowLayout.minimumInteritemSpacing = 0
        collectionView?.isPagingEnabled = true
        collectionView?.bounces = false
        collectionView!.register(PokemonListCellView.self, forCellWithReuseIdentifier: PokemonListCellView.cellId)
        collectionView!.delegate = self
        collectionView!.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        // indentation
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 50)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.datasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonListCellView.cellId, for: indexPath) as! PokemonListCellView
        if indexPath.item < (datasource.count) {
            debugPrint(self.datasource[indexPath.item].name)
        }
        return cell
    }
}
