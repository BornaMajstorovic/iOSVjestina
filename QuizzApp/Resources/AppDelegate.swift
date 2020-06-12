//
//  AppDelegate.swift
//  QuizzApp
//
//  Created by Borna on 09/04/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let loginViewController = LoginViewController()
    let quiztablevc = QuizTableViewController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        //preko singltona odradit provjeru
        if let _ = UserDefaults.standard.string(forKey: "token"){
            showQuizzesVC()
        } else {
            showLoginVC()
        }
    
        return true
    }
    
    private func showLoginVC(){
           let navigationController = UINavigationController(rootViewController: loginViewController)
           navigationController.navigationBar.isHidden = true
           window?.rootViewController = navigationController
           window?.makeKeyAndVisible()
       }
       
       private func showQuizzesVC(){
           let navigationController = UINavigationController(rootViewController: quiztablevc)
           navigationController.navigationBar.isHidden = true
           window?.rootViewController = navigationController
           window?.makeKeyAndVisible()
       }
    
}
// MARK: Outlets
// MARK: Properties
// MARK: Lifecycle methods
// MARK: Actions
// MARK: Class methods
