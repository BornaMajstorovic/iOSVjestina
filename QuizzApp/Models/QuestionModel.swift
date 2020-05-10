//
//  QuestionsModel.swift
//  QuizzApp
//
//  Created by Borna on 10/04/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import Foundation

//class QuestionModel {
//    let id: Int
//    let question: String
//    let answers: [String]
//    let correctAnswer: Int
//
//    init?(json: Any) {
//
//        guard   let questionMap = json as? [String: Any],
//                let idJ = questionMap["id"] as? Int,
//                let questionJ = questionMap["question"] as? String,
//                let ansersJ = questionMap["answers"] as? [String],
//                let correctAnswerJ = questionMap["correct_answer"] as? Int
//                else { return nil }
//        id = idJ
//        question = questionJ
//        answers = ansersJ
//        correctAnswer = correctAnswerJ
//    }
//
//}

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
