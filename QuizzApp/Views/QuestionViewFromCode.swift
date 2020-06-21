//
//  QuestionViewFromCode.swift
//  QuizzApp
//
//  Created by Borna on 19/06/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import UIKit
import PureLayout


protocol QuestionViewDelegate: class {
    func answeardQuestions(isCorrect: Bool)
}

class QuestionViewFromCode: UIView {

    var didSetupConstraints = false
    
    var questionLabel: UILabel?
    var answers: [UIButton] = []
    weak var delegate: QuestionViewDelegate?
    var question: QuestionModel?
      
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
      
    override func updateConstraints() {
        if !didSetupConstraints {
        
            guard let questionLabel = questionLabel else {return}
            
            questionLabel.autoPinEdge(.leading, to: .leading, of: self, withOffset: 20)
            questionLabel.autoPinEdge(.trailing, to: .trailing, of: self, withOffset: -20)
            questionLabel.autoPinEdge(.top, to: .top, of: self, withOffset: 20)
            questionLabel.autoSetDimension(.height, toSize: 50)
            
            answers[0].autoPinEdge(.top, to: .bottom, of: questionLabel, withOffset: 50)
            answers[0].autoPinEdge(.leading, to: .leading, of: self, withOffset: 20)
            answers[0].autoSetDimension(.height, toSize: 50)
            answers[0].autoSetDimension(.width, toSize: 150)
            
            answers[1].autoPinEdge(.top, to: .bottom, of: questionLabel, withOffset: 50)
            answers[1].autoPinEdge(.leading, to: .trailing, of: answers[0], withOffset: 30)
            answers[1].autoPinEdge(.trailing, to: .trailing, of: self, withOffset: -20)
            answers[1].autoSetDimension(.height, toSize: 50)
            answers[1].autoSetDimension(.width, toSize: 150)
            
            answers[2].autoPinEdge(.top, to: .bottom, of: answers[0], withOffset: 20)
            answers[2].autoPinEdge(.leading, to: .leading, of: self, withOffset: 20)
            answers[2].autoSetDimension(.height, toSize: 50)
            answers[2].autoSetDimension(.width, toSize: 150)
            
            answers[3].autoPinEdge(.top, to: .bottom, of: answers[1], withOffset: 20)
            answers[3].autoPinEdge(.leading, to: .trailing, of: answers[2], withOffset: 30)
            answers[3].autoPinEdge(.trailing, to: .trailing, of: self, withOffset: -20)
            answers[3].autoSetDimension(.height, toSize: 50)
            answers[3].autoSetDimension(.width, toSize: 150)
            
            didSetupConstraints = true
            
        }
        super.updateConstraints()
    }
    
    
     func setupView(with model: QuestionModel){
        question = model
        backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.8901960784, blue: 0.6549019608, alpha: 1)
        
        guard   let question = model.question,
            let answearsArr = model.answers else {return}
        
        questionLabel = UILabel()
        questionLabel?.text = question
        questionLabel?.numberOfLines = 2
        UILabel.styleLabel(label: questionLabel!)
  
        if let questionLabel = questionLabel {
            self.addSubview(questionLabel)
        }
        
        addButton(title: answearsArr[0])
        addButton(title: answearsArr[1])
        addButton(title: answearsArr[2])
        addButton(title: answearsArr[3])
    }
    
    func addButton(title: String){
        let button = UIButton()
        UIButton.styleButton(button: button)
        button.setTitle(title, for: .normal)
        button.tintColor = #colorLiteral(red: 0.9703171849, green: 0.7819978595, blue: 0.3436401486, alpha: 1)
        button.addTarget(self, action: #selector(QuestionViewFromCode.answerTapped(sender:)), for: .touchUpInside)
        self.answers.append(button)
        self.addSubview(button)
    }
    
    @objc func answerTapped(sender: UIButton) {
        let isCorrectAnswear = sender.tag == question?.correctAnswer
        sender.backgroundColor = isCorrectAnswear ? .green : .red
        answers.forEach { (btn) in
            btn.isEnabled = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.delegate?.answeardQuestions(isCorrect: isCorrectAnswear)
        })
    }

}

