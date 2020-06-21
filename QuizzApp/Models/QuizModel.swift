//
//  QuizzesModel.swift
//  QuizzApp
//
//  Created by Borna on 10/04/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import Foundation
import UIKit

struct QuizModel: Decodable{
    let id: Int?
    let title: String?
    let description: String?
    let category: String?
    let level: Int?
    let image: String?
    let questions: [QuestionModel]?
}

struct AllQuizzes: Decodable {
    var quizzes: [QuizModel]
}
