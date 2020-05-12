//
//  KategorijaKviza.swift
//  QuizzApp
//
//  Created by Borna on 10/04/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import Foundation
import UIKit

enum Catergory: String {
    case SPORTS
    case SCIENCE
}

extension Catergory {
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
