//
//  TabBarViewController.swift
//  QuizzApp
//
//  Created by Borna on 17/06/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBar()
        
    }
    
    func setUpTabBar(){
        tabBar.barTintColor = #colorLiteral(red: 0.5328530073, green: 0.402020514, blue: 0.6997897029, alpha: 1)
        tabBar.tintColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        tabBar.unselectedItemTintColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        let txtAtrr = [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)]
        
        let quizTableVC = QuizTableViewController()
        let quizTableNVC = UINavigationController(rootViewController: quizTableVC)
        quizTableNVC.navigationBar.tintColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        quizTableNVC.navigationBar.barTintColor = #colorLiteral(red: 0.5328530073, green: 0.402020514, blue: 0.6997897029, alpha: 1)
        quizTableNVC.navigationBar.titleTextAttributes = txtAtrr
        let quizTableBarItem = UITabBarItem(title: "Quiz Table", image: UIImage(named: "list"), tag: 0)
        quizTableNVC.tabBarItem = quizTableBarItem
        
        let searchVC = SearchViewController()
        let searchNVC = UINavigationController(rootViewController: searchVC)
        searchNVC.navigationBar.tintColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        searchNVC.navigationBar.barTintColor = #colorLiteral(red: 0.5328530073, green: 0.402020514, blue: 0.6997897029, alpha: 1)
        searchNVC.navigationBar.titleTextAttributes = txtAtrr
        let searchBarItem = UITabBarItem(title: "Search", image: UIImage(named: "search"), tag: 1)
        searchNVC.tabBarItem = searchBarItem
        
        let settingsVC = SettingsViewController()
        let settingsBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "settings"), tag: 2)
        settingsVC.tabBarItem = settingsBarItem
        
        viewControllers = [quizTableNVC, searchNVC, settingsVC]
        
        
    }
}
