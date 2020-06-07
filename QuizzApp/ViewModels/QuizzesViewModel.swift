//
//  QuizzesViewModel.swift
//  QuizzApp
//
//  Created by Borna on 02/06/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import Foundation

class QuizzesViewModel {
    private var quizzes: AllQuizzes?
    
    func fetchQuizzes(){
        
        let quizService = QuizzesService()
        quizService.fetchQuizzes() { [weak self](result) in
            DispatchQueue.main.async {
                switch result{
                case .success(let model):
                    self?.quizzes?.quizzes = model.quizzes
                case .failure(let err):
                    print("Failed to fetc", err)
                }
            }
            
        }
        
    }
    
    func numberOfQuizzes(category: Category)->Int{
        return quizzesByCategory(category: category)?.count ?? 0
    }
    
    func quizzesByCategory(category: Category) -> [QuizModel]? {
        return quizzes?.quizzes.filter({ (quiz) -> Bool in
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
