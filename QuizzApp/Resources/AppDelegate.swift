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
        
        let loginViewController = LoginViewController()
        let navigationController = UINavigationController(rootViewController: loginViewController)
        navigationController.navigationBar.isHidden = true
       
        
//        let vc = InitialViewController()
//        window?.rootViewController = vc
        
        window?.rootViewController = loginViewController
        
        window?.makeKeyAndVisible()
        
        return true
    }



}
// MARK: Outlets
// MARK: Properties
// MARK: Lifecycle methods
// MARK: Actions
// MARK: Class methods
