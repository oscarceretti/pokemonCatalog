//
//  Material+Extras.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 13/02/2021.
//

import Foundation
import UIKit

protocol MaterialView {
    func elevate(elevation: Double)
}
extension UIView: MaterialView {
    
    func elevate(elevation: Double) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = Theme.Colors.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: elevation)
        self.layer.shadowRadius = CGFloat(elevation)
        self.layer.shadowOpacity = 0.24
    }
    
    func elevateWithBounds(elevation: Double) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = Theme.Colors.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: elevation)
        self.layer.shadowRadius = CGFloat(elevation)
        self.layer.shadowOpacity = 0.24
    }
    
}
