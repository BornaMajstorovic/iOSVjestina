//
//  TableViewTemplateViewController.swift
//  QuizzApp
//
//  Created by Borna on 18/06/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import UIKit

class TableViewTemplateViewController: UIViewController {
    
    // MARK: Properties
    private var  viewModel: QuizzesViewModel?
    private var refreshControl: UIRefreshControl!
    private let cellReuseIdentifier = "cellReuseIdentifier"

    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    // MARK: Class methods
    
    //na refreshu javlja ambigues, a ideja da spojim u ovoj klasi na tableView outlet, tableView iz quiztablevc i searchvc takoder se pokazala neuspjesnom

//    func setUpTableView(tableView: UITableView){
//        tableView.backgroundColor = UIColor.lightGray
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.separatorStyle = .none
//
//        refreshControl = UIRefreshControl()
//        refreshControl.addTarget(self, action: #selector(QuizTableViewController.refresh), for: UIControl.Event.valueChanged)
//        tableView.refreshControl = refreshControl
//
//        tableView.register(UINib(nibName: "QuizzesTableViewCell", bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
//
//        let tableFooterView = QuizzFooterView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
//        tableView.tableFooterView = tableFooterView
//
//    }
//
//    func setUpViewModel(tableView: UITableView)  {
//        viewModel = QuizzesViewModel()
//        viewModel?.fetchQuizzes(completion: { (result) in
//            DispatchQueue.main.async {
//                switch result{
//                case .success(let model):
//                    self.viewModel?.quizzes = model.quizzes
//                    self.refresh(tableView: tableView)
//                case .failure(let err):
//                    print("Failed to fetc", err)
//                }
//            }
//        })
//    }
//
//    @objc func refresh(tableView: UITableView) {
//        DispatchQueue.main.async {
//            self.tableView.reloadData()
//            self.refreshControl.endRefreshing()
//        }
//    }
    

}

extension TableViewTemplateViewController: UITableViewDelegate {
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

extension TableViewTemplateViewController: UITableViewDataSource {
    
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
