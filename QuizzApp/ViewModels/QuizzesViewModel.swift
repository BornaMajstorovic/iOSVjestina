//
//  QuizzesViewModel.swift
//  QuizzApp
//
//  Created by Borna on 02/06/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import Foundation

class QuizzesViewModel {
    var quizzes: [QuizModel]?
    
    func fetchQuizzes(completion: @escaping ((Result<AllQuizzes, Error>)->Void)){
        let quizService = QuizzesService()
        quizService.fetchQuizzes() { (result) in
            completion(result)
        }
        
    }
    
    func numberOfQuizzes(category: Category)->Int{
        return quizzesByCategory(category: category)?.count ?? 0
    }
    
    func quizzesByCategory(category: Category) -> [QuizModel]? {
        return quizzes?.filter({ (quiz) -> Bool in
            return quiz.category == category.rawValue
        })
    }
    
    func singleQuizViewModel(forIndexPath indexpath: IndexPath) -> SingleQuizViewModel? {
        let category = Category.allCases[indexpath.section]
        guard let quizzesByCategory = quizzesByCategory(category: category)  else {return nil}
        return SingleQuizViewModel(quiz: quizzesByCategory[indexpath.row])
    }
    
    func quizViewModel(forIndexPath indexpath: IndexPath) -> QuizCellModel? {
        let category = Category.allCases[indexpath.section]
        guard let quizzesByCategory = quizzesByCategory(category: category)  else {return nil}
        return QuizCellModel(quiz: quizzesByCategory[indexpath.row])
    }
    
    
}
