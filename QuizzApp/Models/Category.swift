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
                return UIColor.yellow
            case .SCIENCE:
                return UIColor.red
            }
        }
    }
}
