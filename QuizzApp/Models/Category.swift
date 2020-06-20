//
//  KategorijaKviza.swift
//  QuizzApp
//
//  Created by Borna on 10/04/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import Foundation
import UIKit

enum Category: String, CaseIterable {
    case SPORTS
    case SCIENCE
}

extension Category {
    var color : UIColor {
        get {
            switch self {
            case .SPORTS:
                return #colorLiteral(red: 0.2196078431, green: 0.9647058824, blue: 0.537254902, alpha: 1)
            case .SCIENCE:
                return #colorLiteral(red: 1, green: 0.8431372549, blue: 0, alpha: 1)
            }
        }
    }
}
