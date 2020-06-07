//
//  QuizCellModel.swift
//  QuizzApp
//
//  Created by Borna on 02/06/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import Foundation

struct QuizCellModel {
    let title: String
    let description: String
    let level: String
    let imageUrl: URL?
    
    init(quiz: QuizModel) {
        self.title = quiz.title
        self.description = quiz.description
        self.level = String(repeating: "*", count: quiz.level)
        self.imageUrl = URL(string: quiz.image ?? "")
    }
}
