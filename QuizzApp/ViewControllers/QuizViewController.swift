//
//  QuizViewController.swift
//  QuizzApp
//
//  Created by Borna on 02/06/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var quizImage: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var scroolView: UIScrollView!
    
    
    // MARK: Properties
    var viewModel: SingleQuizViewModel?
    var answears: [Bool] = []
    var questionViews: [QuestionView] = []
    var startTime: Date?
    
    convenience init(viewModel: SingleQuizViewModel) {
           self.init()
           self.viewModel = viewModel
    }
    

    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = viewModel?.title
        quizImage.kf.setImage(with: viewModel?.imageUrl)
        scroolView.isHidden = true
        
        setUpScroll()
        
    }
    
   

    // MARK: Actions
    @IBAction func startButtonTapped(_ sender: UIButton) {
        startTime = Date()
        startButton.isHidden = true
        scroolView.isHidden = false
    }
    
    // MARK: Class methods
    
    func postResults(){
        guard let viewModel = viewModel else{return}
        let quizId = viewModel.id
        let numOfCorrect = answears.filter { (ans) -> Bool in
            return ans
        }.count
        guard let startTime = startTime else{return}
        let timePassed = Double(Date().timeIntervalSince(startTime))
        let quizService = QuizzesService()
        
        quizService.sendResult(quizId: quizId, time: timePassed, numOfCorrect: numOfCorrect) { (http) in
            print("proslo")
        }
        
    }
    
    func setUpScroll() {
        guard let viewModel = viewModel else{return}
        let questionWidth = scroolView.frame.width
        let fullWidth = questionWidth*CGFloat(viewModel.numberOfQuestions)
        scroolView.contentSize = CGSize(width: fullWidth, height: scroolView.frame.height)
        let arr: [QuestionModel] = viewModel.questions
        for (i, question) in arr.enumerated() {
            let offset = questionWidth*CGFloat(i)
            let questionView = QuestionView(frame: CGRect(origin: CGPoint(x: offset, y: 0), size: scroolView.frame.size))
            questionView.delegat = self
            questionView.configureWith(model: question)
            scroolView.addSubview(questionView)
        }
    }
}
extension QuizViewController: QuestionViewDelegate {
    func answeardQuestions(isCorrect: Bool) {
        answears.append(isCorrect)
        if answears.count == viewModel?.numberOfQuestions {
            postResults()
        } else{
            let offset = scroolView.frame.width * CGFloat(answears.count)
            scroolView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
        }
    }
    
    
}
