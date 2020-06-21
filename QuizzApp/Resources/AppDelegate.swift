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
        
        let showVCfunc: (UIViewController)->Void = showVC
        UserCredentials.shared.isUserLoggedIn(function: showVCfunc)
       
        return true
    }

    private func showVC(vc: UIViewController)->Void{
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }
}


