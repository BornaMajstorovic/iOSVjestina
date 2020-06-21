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
        if let title = quiz.title,
            let description = quiz.description,
            let level = quiz.level {
            self.title = title
            self.description = description
            self.level = String(repeating: "*", count: level)
            self.imageUrl = URL(string: quiz.image ?? "")
        } else {
            self.title = "null"
            self.description = "null"
            self.level = String(repeating: "*", count: 0)
            self.imageUrl = URL(string: quiz.image ?? "")
        }}
}
