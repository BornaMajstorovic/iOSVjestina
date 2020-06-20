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
    let loginVC = LoginViewController()
    let tabBarVC = TabBarViewController()
   
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        let showVCfunc: (UIViewController)->Void = showVC
        
//        if let _ = UserDefaults.standard.string(forKey: "token"){
//            showVC(vc: tabBarVC)
//        } else {
//            showVC(vc: loginVC)
//        }
        //uvijek ode na login
        UserCredentialsAndNavigation.shared.isUserLoggedIn(function: showVCfunc)
        
       
        return true
    }

    private func showVC(vc: UIViewController)->Void{
        let nvc = UINavigationController(rootViewController: vc)
        window?.rootViewController = nvc
        window?.makeKeyAndVisible()
    }
}


