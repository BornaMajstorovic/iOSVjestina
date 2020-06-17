//
//  ScoreModel.swift
//  QuizzApp
//
//  Created by Borna on 17/06/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import Foundation

struct ScoreModel: Decodable {
    let score: Double
    let username: String?
}
struct AllScores: Decodable {
    var allScores: [ScoreModel]
}
extension ScoreModel: Comparable {
    static func < (lhs: ScoreModel, rhs: ScoreModel) -> Bool {
        return lhs.score < rhs.score
    }
    static func > (lhs: ScoreModel, rhs: ScoreModel) -> Bool {
        return lhs.score > rhs.score
    }
}
