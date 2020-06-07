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


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        if let _ = UserDefaults.standard.string(forKey: "token"){
            let quiztablevc = QuizTableViewController()
            let navigationController = UINavigationController(rootViewController: quiztablevc)
            navigationController.navigationBar.isHidden = true
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
        } else {
            let loginViewController = LoginViewController()
            let navigationController = UINavigationController(rootViewController: loginViewController)
            navigationController.navigationBar.isHidden = true
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
        }
    
        
        return true
    }
}
// MARK: Outlets
// MARK: Properties
// MARK: Lifecycle methods
// MARK: Actions
// MARK: Class methods
