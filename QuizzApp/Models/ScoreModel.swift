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

//extension ScoreModel: Comparable {
//    static func < (lhs: ScoreModel, rhs: ScoreModel) -> Bool {
//        guard let lhs = lhs, let rhs = rhs else {return false}
//        return lhs.score < rhs.score
//    }
//    static func > (lhs: ScoreModel, rhs: ScoreModel) -> Bool {
//        guard let lhs = lhs, let rhs = rhs else {return false}
//        return lhs.score > rhs.score
//    }
//}
