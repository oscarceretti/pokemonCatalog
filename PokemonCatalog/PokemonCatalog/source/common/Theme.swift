//
//  Theme.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 13/02/2021.
//

import Foundation
import UIKit
struct Theme {
    struct Colors {
        //Standard Colors
        static let translucentBlack = UIColor.black.withAlphaComponent(0.6)
        static let black = UIColor.black
        static let white = UIColor.white
        static let clear = UIColor.clear
        
        // Custom Theme#831C4C
        static let border = UIColor(hex: "CCCCCC")
        static let mainGreen = UIColor(hex: "34B757")
        static let mainTheme = UIColor(hex: "E9304A")
        static let complementTheme = UIColor(hex: "B73672")
        static let TransparentComplementTheme = UIColor(hex: "831C4C", alpha: 0.70)
        //static let transparentLayer = UIColor(hex: "58282F", alpha: 0.45)
        
        static let opaqueBlack = UIColor(hex: "454545")
        static let permissionSubTitle = UIColor(hex: "777777")
        
        static let lightGray = UIColor(hex: "E6E6E6")
        static let gray = UIColor(hex: "5C5C5C")
        static let heavyGray = UIColor(hex: "898989")
        static let grayText = UIColor(hex: "E6E6E6")
        static let filterBorder = UIColor(hex: "CCCCCC")
        static let backgroundImage = UIColor(hex: "2E2E2E")
        static let lightBalck = UIColor(hex: "646464")
        static let blackText = UIColor(hex: "272727")

        static let blackSearch = UIColor(hex: "212121")
        static let greySearch = UIColor(hex: "454545")
        static let greyLabelSearch = UIColor(hex: "777777")
        
        static let blackGradient = UIColor(hex: "070707").withAlphaComponent(0.7)
        static let hardBlackGradient = UIColor(hex: "070707").withAlphaComponent(1)
        static let grayGradient1 = UIColor(hex: "272727").withAlphaComponent(0.40)
        static let hardGrayGradient1 = UIColor(hex: "272727").withAlphaComponent(0.64)
        static let whiteGradient = UIColor(hex: "2B2B2B").withAlphaComponent(0.20)
        static let testGradient = UIColor(hex: "2B2B2B").withAlphaComponent(0)
    }
}
