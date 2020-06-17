//
//  SingleQuizViewModel.swift
//  QuizzApp
//
//  Created by Borna on 02/06/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import Foundation

class SingleQuizViewModel  {
    let quiz: QuizModel?
    
    init(quiz: QuizModel?) {
        self.quiz = quiz
    }
    
    var id: Int {
        return quiz?.id ?? -1
    }
    var title: String {
        return quiz?.title ?? ""
    }
    var description: String {
        return quiz?.description ?? ""
    }
    var imageUrl: URL? {
        guard let urlString = quiz?.image else {return nil}
        return URL(string: urlString)
    }
    var questions: [QuestionModel] {
        return quiz?.questions ?? []
    }
    var numberOfQuestions: Int {
        return quiz?.questions.count ?? 0
    }
}
