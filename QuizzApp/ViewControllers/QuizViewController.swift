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
    @IBOutlet weak var questionContainer: UIView!
    
    // MARK: Properties
    var viewModel: SingleQuizViewModel?
    var answears: [Bool] = []
    
    var startTime: Date?
    
    convenience init(viewModel: SingleQuizViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    

    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setUpScroll()
    }
    

    // MARK: Actions
    @IBAction func startButtonTapped(_ sender: UIButton) {
        startTime = Date()
        startButton.isHidden = true
        scroolView.isHidden = false
    }
    
    // MARK: Class methods
    
    func setup(){
        navigationItem.title = "Single Quiz"
        self.view.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.8901960784, blue: 0.6549019608, alpha: 1)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Leaderboard", style: .plain, target: self, action: #selector(onTapLeaderboard))
        titleLabel.text = viewModel?.title
        UILabel.styleLabel(label: titleLabel)
        UIButton.styleButton(button: startButton)
        quizImage.kf.setImage(with: viewModel?.imageUrl)
        scroolView.isHidden = true
    }
    
    func postResults(){
        guard let viewModel = viewModel else{return}
        let quizId = viewModel.id
        let numOfCorrect = answears.filter {$0}.count
        guard let startTime = startTime else{return}
        let timePassed = Double(Date().timeIntervalSince(startTime))
        let quizService = QuizzesService()
        
        quizService.sendResult(quizId: quizId, time: timePassed, numOfCorrect: numOfCorrect) { _ in
        }
        
    }
    
    func setUpScroll() {
        guard let viewModel = viewModel else{return}
        let questionWidth = scroolView.frame.width
        let fullWidth = questionWidth*CGFloat(viewModel.numberOfQuestions)
        scroolView.contentSize = CGSize(width: fullWidth, height: scroolView.frame.height)
        scroolView.isScrollEnabled = true
        
        
        let arr: [QuestionModel] = viewModel.questions
        for (i, question) in arr.enumerated() {
            let offset = questionWidth*CGFloat(i)
            let questionView = QuestionViewFromCode(frame: CGRect(origin: CGPoint(x: offset, y: 0), size: scroolView.frame.size))
            questionView.delegate = self
            questionView.setupView(with: question)
            scroolView.addSubview(questionView)
        }
    }
    
    @objc func onTapLeaderboard() {
        guard let quiz = viewModel?.quiz else {return}
        let leadeBoardVM = LeaderboardViewModel(quiz: quiz)
        let leaderboardVC = LeaderboardViewController(viewModel: leadeBoardVM)
        present(leaderboardVC,animated: true,completion: nil)
    }
}
extension QuizViewController: QuestionViewDelegate {
    func answeardQuestions(isCorrect: Bool) {
        answears.append(isCorrect)
        if answears.count == viewModel?.numberOfQuestions {
            postResults()
            self.showAlert(title: "Quiz ended", message: "Quiz je zavrsen")
        } else{
            let offset = scroolView.frame.width * CGFloat(answears.count)
            scroolView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
        }
    }
    
    
}
