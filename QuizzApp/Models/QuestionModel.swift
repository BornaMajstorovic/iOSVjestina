//
//  QuestionsModel.swift
//  QuizzApp
//
//  Created by Borna on 10/04/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import Foundation

struct QuestionModel: Decodable{
    let id: Int?
    let question: String?
    let answers: [String]?
    let correctAnswer: Int?
       
    enum CodingKeys: String, CodingKey {
        case id
        case question
        case answers
        case correctAnswer = "correct_answer"
    }
}
