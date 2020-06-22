//
//  ScoreModel.swift
//  QuizzApp
//
//  Created by Borna on 17/06/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import Foundation

struct ScoreModel: Decodable {
    var score: String?
    var username: String?
}

extension ScoreModel: Comparable {
    static func < (lhs: ScoreModel, rhs: ScoreModel) -> Bool {
        guard let lhs = Double(lhs.score!), let rhs = Double(rhs.score!) else {return false}
        return lhs < rhs
    }
    static func > (lhs: ScoreModel, rhs: ScoreModel) -> Bool {
        guard let lhs = Double(lhs.score!), let rhs = Double(rhs.score!) else {return false}
        return lhs > rhs
    }
}
