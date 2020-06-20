//
//  QuestionView.swift
//  QuizzApp
//
//  Created by Borna on 10/04/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import UIKit

//protocol QuestionViewDelegate: class {
//    func answeardQuestions(isCorrect: Bool)
//}


final class QuestionView: UIView {
    
    // MARK: Outlets
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private weak var answerButton1: UIButton!
    @IBOutlet private weak var answerButton2: UIButton!
    @IBOutlet private weak var answerButton3: UIButton!
    @IBOutlet private weak var answerButton4: UIButton!
    
    // MARK: Properties
    var correctAnswer: Int?
    weak var delegat: QuestionViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Actions
    // TODO: popravit correctAnswer...ovo je uzasno rjesenje
    @IBAction func tappedBtn1(_ sender: UIButton) {
        if correctAnswer == 1 {
            answerButton1.backgroundColor = .green
        } else {
            answerButton1.backgroundColor = .red
        }
    }
    @IBAction func tappedBtn2(_ sender: UIButton) {
        if correctAnswer == 2 {
            answerButton2.backgroundColor = .green
        } else {
            answerButton2.backgroundColor = .red
        }
    }
    @IBAction func tappedBtn3(_ sender: UIButton) {
        if correctAnswer == 3 {
            answerButton3.backgroundColor = .green
        } else {
            answerButton3.backgroundColor = .red
        }
    }
    @IBAction func tappedBtn4(_ sender: UIButton) {
        if correctAnswer == 4 {
            answerButton4.backgroundColor = .green
        } else {
            answerButton4.backgroundColor = .red
        }
    }
  
    
    
    // MARK: Class methods
    func configureWith(model: QuestionModel) {
        guard
            let question = model.question,
            let answers = model.answers else {return}
        
        questionLabel?.text = question
        answerButton1?.setTitle(answers[0], for: .normal)
        answerButton2?.setTitle(answers[1], for: .normal)
        answerButton3?.setTitle(answers[2], for: .normal)
        answerButton4?.setTitle(answers[3], for: .normal)
        
        correctAnswer = model.correctAnswer
    
    }
    
}
//    private func handleCorrectAnswer(button: UIButton, buttonAnswer: Int) {
//    if correctAnswer == buttonAnswer {
//        button.backgroundColor = .green
//    } else {
//        button.backgroundColor = .red
//    }
//} sve buttone na jedan ibaction
