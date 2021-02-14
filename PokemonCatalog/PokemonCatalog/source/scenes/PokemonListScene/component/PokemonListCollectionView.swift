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
protocol PokemonListCollectionViewDelegate: class {
    func askForMore()
    func openDetail(urlString: String)
}

final class PokemonListCollectionView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionView : UICollectionView?
    let cellSpacing:CGFloat = 2
    
    var datasource: [Pokemon] = []
//    var indexPath : IndexPath? = nil
    
    weak var delegate: PokemonListCollectionViewDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(datasource: [Pokemon]) {
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
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        collectionViewFlowLayout.minimumLineSpacing = 20
        collectionViewFlowLayout.minimumInteritemSpacing = 20
        
        collectionView?.isPagingEnabled = true
        collectionView?.bounces = false
        
        collectionView!.register(PokemonListCellView.self, forCellWithReuseIdentifier: PokemonListCellView.cellId)
        collectionView!.delegate = self
        collectionView!.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        // indentation
        return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.datasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonListCellView.cellId, for: indexPath) as! PokemonListCellView
        if indexPath.item < (datasource.count) {
            cell.pokemonImage.image = UIImage()
            let imageURL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(indexPath.item + 1).png")
            if let url = imageURL {
                cell.pokemonImage.load(url: url)
            }
            cell.pokemonName.text = self.datasource[indexPath.item].name
           
        }
        
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == datasource.count - 1 {
            self.delegate?.askForMore()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,didSelectItemAt indexPath: IndexPath){
        self.delegate?.openDetail(urlString: datasource[indexPath.row].url)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.size.width - 50) / 2
        let height = width
        return CGSize(width: width, height: height)
    }
}
