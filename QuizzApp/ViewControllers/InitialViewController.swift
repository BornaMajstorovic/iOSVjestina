//
//  InitialViewController.swift
//  QuizzApp
//
//  Created by Borna on 10/04/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import UIKit

final class InitialViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet private weak var getQuizButton: UIButton!
    @IBOutlet private weak var errorLabel: UILabel!
    @IBOutlet private weak var funFactLabel: UILabel!
    @IBOutlet private weak var quizImagView: UIImageView!
    @IBOutlet private weak var quizTitleLabel: UILabel!
    @IBOutlet private weak var questionContainer: UIView!
    
    // MARK: Properties
    private var allQuizzes: [QuizModel]?
    
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
        quizImagView.isHidden = true
        quizTitleLabel.isHidden = true
    }
    
    // MARK: Actions
    @IBAction func getQuizTapped(_ sender: UIButton) {
           fetchQuizes()
    }
    
    // MARK: Class methods
    private func fetchQuizes() {
        let urlString = "https://iosquiz.herokuapp.com/api/quizzes"
        
        let quizService = QuizzesService()
        
        quizService.fetchQuizzes(urlString: urlString){(result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    self.allQuizzes = model.quizzes
                    
                    let questions = model.quizzes.flatMap {quizModel in
                        quizModel.questions
                    }.filter { questionModel -> Bool in
                        guard let question = questionModel.question else { return false }
                        return question.contains("NBA")
                    }
                    
                    self.funFactLabel.text = String(questions.count)
                    
                    let randomQuiz = self.allQuizzes?.randomElement()
                    
                    guard let quiz = randomQuiz else{return}
                    
                    
                    
                    
                    let question = quiz.questions.randomElement()
                    
                    if let questionView = Bundle.main.loadNibNamed("QuestionView", owner: nil, options: nil)?.first as? QuestionView {
                        questionView.configureWith(model: question)
                        self.questionContainer.addSubview(questionView)
                    }
                    
                    
                case .failure(let err):
                    print("Failed to fetc", err)
                    self.errorLabel.isHidden = false
                    
                }
                
            }
        }
        
       
    
    }
}
