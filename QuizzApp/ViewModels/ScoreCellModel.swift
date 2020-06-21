//
//  ScoreCellModel.swift
//  QuizzApp
//
//  Created by Borna on 17/06/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import Foundation

struct ScoreCellModel {
    var user: String?
    var score: String?
    var place: Int
    
    
    init(skor: ScoreModel, place: Int) {
        self.user = skor.username ?? "strangerDanger"
        self.score = skor.score
        self.place = place
    }
}
