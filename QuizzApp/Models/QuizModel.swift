//
//  QuizzesModel.swift
//  QuizzApp
//
//  Created by Borna on 10/04/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import Foundation
import UIKit

//class QuizModel {
//    let id: Int
//    let title: String
//    let description: String
//    let category: Catergory?
//    let level: Int
//    let image: UIImage?
//    var questions: [QuestionModel] = []
//
//    init?(json: Any) {
//
//        guard   let jsonMap = json as? [String : Any],
//            let idJ = jsonMap["id"] as? Int,
//            let titleJ = jsonMap["title"] as? String,
//            let descriptionJ = jsonMap["description"] as? String,
//            let categoryJ = jsonMap["category"] as? String,
//            let levelJ = jsonMap["level"] as? Int,
//            let imageJ = jsonMap["image"] as? Data,
//            let questionsJ = jsonMap["questions"] as? [Any]
//        else { return nil }
//
//        id = idJ
//        title = titleJ
//        description = descriptionJ
//        level = levelJ
//
//        for question in questionsJ {
//            if let question = QuestionModel(json: question){
//                self.questions.append(question)
//            }
//        }
//        if let categoryQ = Catergory(rawValue: categoryJ), let imageQ = UIImage(data: imageJ){
//            category = categoryQ
//            image = imageQ
//        } else {
//            category = nil
//            image = nil
//        }
//
//
//    }
//}

struct QuizModel: Decodable{
    let id: Int
    let title: String
    let description: String
    let category: String
    let level: Int
    let image: String?
    let questions: [QuestionModel]
}

struct AllQuizzes: Decodable {
    let quizzes: [QuizModel]
}
