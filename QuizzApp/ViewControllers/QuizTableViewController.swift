//
//  QuizListViewController.swift
//  QuizzApp
//
//  Created by Borna on 29/05/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import UIKit

class QuizTableViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    private var  viewModel: QuizzesViewModel?
    private var refreshControl: UIRefreshControl!
    private let cellReuseIdentifier = "cellReuseIdentifier"
    
    convenience init(viewModel: QuizzesViewModel){
        self.init()
        self.viewModel = viewModel
    }
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.fetchQuizzes()
        self.refresh()
        setUpTableView()
    }
    
    
    // MARK: Class methods

    func setUpTableView(){
        tableView.backgroundColor = UIColor.lightGray
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(QuizTableViewController.refresh), for: UIControl.Event.valueChanged)
        tableView.refreshControl = refreshControl
        
        tableView.register(UINib(nibName: "QuizzesTableViewCell", bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
        
        let tableFooterView = QuizzFooterView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        tableView.tableFooterView = tableFooterView
        
    }
    
    @objc func refresh() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
}

extension QuizTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    } // visina jednog cella
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let category  = Category.allCases[section]
        return QuizzHeaderView(title: category.rawValue, color: category.color)
    }// view za header jedne sekcije
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    } // height za header
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let viewModel = self.viewModel?.singleQuizViewModel(forIndexPath: indexPath) else {return}
        let quizViewController = QuizViewController(viewModel: viewModel)
        navigationController?.pushViewController(quizViewController, animated: true)
    }//na tap cella prijedi na quizvc
    
    
}

extension QuizTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? QuizzesTableViewCell {
            if let quiz = viewModel?.quizViewModel(forIndexPath: indexPath){
                cell.configure(withQuizz: quiz)
            }
            return cell
        }
        return QuizzesTableViewCell()
        
    } // napravi cell za odredni indexpath
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Category.allCases.count
    } // broj sectiona
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let category = Category.allCases[section]
        return self.viewModel?.numberOfQuizzes(category: category) ?? 0
    } //broj kvizova u kategoriji
    
   
    
    
}
