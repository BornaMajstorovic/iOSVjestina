//
//  QuestionView.swift
//  QuizzApp
//
//  Created by Borna on 10/04/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import UIKit

final class QuestionView: UIView {
    
    // MARK: Outlets
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private weak var answerButton1: UIButton!
    @IBOutlet private weak var answerButton2: UIButton!
    @IBOutlet private weak var answerButton3: UIButton!
    @IBOutlet private weak var answerButton4: UIButton!
    
    
    // MARK: Properties

    
    func configureWith(model: QuestionModel?) {
        guard   let model = model,
                let question = model.question,
                let answers = model.answers else{return}
        
        questionLabel.text = question
        answerButton1.setTitle(answers[0], for: .normal)
        answerButton2.setTitle(answers[1], for: .normal)
        answerButton3.setTitle(answers[2], for: .normal)
        answerButton4.setTitle(answers[3], for: .normal)
    }
    
}
