//
//  Asset.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 17/02/2021.
//

import Foundation
import UIKit

enum Asset: String {
    case bug = "bug"
    case water = "water"
    case fire = "fire"
    case grass = "grass"
    case ground = "ground"
    case rock = "rock"
    case steel = "steel"
    case ice = "ice"
    case electric = "electric"
    case dragon = "dragon"
    case ghost = "ghost"
    case psychic = "psychic"
    case normal = "normal"
    case fighting = "fighting"
    case poison = "poison"
    case flying = "flying"
    case dark = "dark"
    case fairy = "fairy"
}



extension Asset {
    var image: UIImage {
        return UIImage(asset: self)
    }
}


extension UIImage {
    convenience init(asset: Asset) {
        self.init(named: asset.rawValue)!
    }
}
