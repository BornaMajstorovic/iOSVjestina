//
//  LeaderboardViewModel.swift
//  QuizzApp
//
//  Created by Borna on 17/06/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import Foundation

class LeaderboardViewModel {
    var quizScores: [ScoreModel]?
    private var quiz: QuizModel?
    
    init(quiz: QuizModel) {
        self.quiz = quiz
    }
    
    var quizTitle: String {
        return quiz?.title ?? ""
    }
    
    func fetchScores(completion: @escaping ((Result<AllScores, Error>)->Void)){
        let quizService = QuizzesService()
        guard let quiz = quiz else {return}
        quizService.fetchScores(quizId: quiz.id) { (res) in
            completion(res)
        }
        
    }
    
    func numberOfScores()->Int {
        return quizScores?.count ?? 0
    }
    
    func scoreData(forIndexPath indexpath: IndexPath) -> ScoreCellModel? {
        guard let quizScores = quizScores else {return nil}
        let quizScoreElem = quizScores[indexpath.row]
    
        return ScoreCellModel(skor: quizScoreElem, place: indexpath.row + 1)
    }
    
    
}

