//
//  LeaderboardViewController.swift
//  QuizzApp
//
//  Created by Borna on 17/06/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import UIKit

class LeaderboardViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    private var viewModel: LeaderboardViewModel?
    private var refreshControl: UIRefreshControl!
    private let cellReuseIdentifier = "scoreCellReuseIdentifier"
    // MARK: Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
        setUpViewModel()

    }
    
    convenience init(viewModel: LeaderboardViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    // MARK: Actions
    @IBAction func closeTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Class methods

    func setUpTableView() {
        tableView.backgroundColor = UIColor.lightGray
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(LeaderboardViewController.refresh), for:  UIControl.Event.valueChanged)
        tableView.refreshControl = refreshControl
        
        tableView.register(UINib(nibName: "ScoreTableViewCell", bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
    }
    
    func setUpViewModel() {
        viewModel?.fetchScores(completion: { (res) in
            DispatchQueue.main.async {
                switch res{
                case .success(let _):
                    self.refresh()
                case .failure(let err):
                    self.showAlert(title: "errror", message: err.localizedDescription)
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

extension LeaderboardViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfScores() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? ScoreTableViewCell {
            if let score = viewModel?.scoreData(forIndexPath: indexPath) {
                cell.configure(withScore: score)
            }
            return cell
        }
        return ScoreTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}


