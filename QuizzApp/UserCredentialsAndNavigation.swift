//
//  UserCredentials.swift
//  QuizzApp
//
//  Created by Borna on 10/06/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import Foundation
import UIKit

final class UserCredentialsAndNavigation {
    private var quizToken: String?
    private var userId: String?
    
    private init(){}
    static let shared = UserCredentialsAndNavigation()
    
    func saveUser(loginModel: LoginModel){
        UserDefaults.standard.set(loginModel.userId, forKey: "userId")
        UserDefaults.standard.set(loginModel.token, forKey: "token")
    }
    
    func deleteUser(completion:(Bool)->()){
        UserDefaults.standard.removeObject(forKey: "token")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window!.rootViewController = LoginViewController()
        completion(true)
    }
    
    func isUserLoggedIn(function: (UIViewController)->Void){
        let loginVC = LoginViewController()
        let tabVC = TabBarViewController()
        if let _ = UserDefaults.standard.string(forKey: "token"){
            function(tabVC)
        } else {
            function(loginVC)
        }
    }
    
    func showLoginVC(){
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.window?.rootViewController = LoginViewController()
        }
    }
    
    func showTabBarVC(){
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.window?.rootViewController = TabBarViewController()
        }
    }
    
    
    
}
