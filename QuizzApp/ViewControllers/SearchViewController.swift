//
//  SearchViewController.swift
//  QuizzApp
//
//  Created by Borna on 17/06/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: Properties
    private var  viewModel: QuizzesViewModel?
    private var refreshControl: UIRefreshControl!
    private let cellReuseIdentifier = "cellReuseIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Search"
        searchBar.barTintColor = #colorLiteral(red: 0.5328530073, green: 0.402020514, blue: 0.6997897029, alpha: 1)
        //ne radi??
        searchBar.tintColor = #colorLiteral(red: 0.9703171849, green: 0.7819978595, blue: 0.3436401486, alpha: 1)
        
        setUpTableView()
        setUpViewModel()
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
    
    func setUpViewModel()  {
        viewModel = QuizzesViewModel()
        viewModel?.fetchQuizzes(completion: { (result) in
            DispatchQueue.main.async {
                switch result{
                case .success(let model):
                    self.viewModel?.quizzes = model.quizzes
                    self.refresh()
                case .failure(let err):
                    self.showAlert(title: "Error", message: err.localizedDescription)
                }
            }
        })
    }
    
    @objc func refresh() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }

    

}
extension SearchViewController: UITableViewDelegate {
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
        
        UIView.beginAnimations("flipajVC", context: nil)
        UIView.setAnimationDuration(1.0)
        
        guard let viewModel = self.viewModel?.singleQuizViewModel(forIndexPath: indexPath) else {return}
        let quizViewController = QuizViewController(viewModel: viewModel)
        navigationController?.pushViewController(quizViewController, animated: true)
        
        UIView.setAnimationTransition(UIView.AnimationTransition.flipFromLeft, for: (self.navigationController?.view)!, cache: false)
        UIView.commitAnimations()
    }//na tap cella prijedi na quizvc
    
    
   
}

extension SearchViewController: UITableViewDataSource {
    
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

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
}



