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
    
    func fetchScores(completion: @escaping ((Result<[ScoreModel], Error>)->Void)){
        let quizService = QuizzesService()
        guard let quiz = quiz, let id = quiz.id else {return}
        quizService.fetchScores(quizId: id) { (res) in
            DispatchQueue.main.async {
                switch res {
                case .success(let model):
                    self.quizScores = model.filter{$0.score != nil}.sorted{$0 > $1}
                    if let arr = self.quizScores?.prefix(upTo: 20){
                        self.quizScores = Array(arr)
                        completion(.success(Array(arr)))
                    }
                    

                case .failure( _):
                    print("err")
                }
            }
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


