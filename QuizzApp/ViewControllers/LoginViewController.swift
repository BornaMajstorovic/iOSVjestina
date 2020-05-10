//
//  LoginViewController.swift
//  QuizzApp
//
//  Created by Borna on 09/05/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var  loginModel: LoginModel?
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        loginAndNavigateToInital()
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

   private func loginAndNavigateToInital() {
        
        let loginService = LoginService()
        guard   let username = usernameTF.text,
                let password = passwordTF.text  else {print("textfildovi prazni"); return}
        loginService.loginUserWith(username: username, password: password) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    self.loginModel = model
                    self.saveCredentials(loginModel: model)
                    self.navigateToInital()
                case .failure(let err):
                    print("Failed to fetch token:", err)
                }
            }
        }
    }

    private func saveCredentials(loginModel: LoginModel) {
           UserDefaults.standard.set(loginModel.userId, forKey: "userId")
           UserDefaults.standard.set(loginModel.token, forKey: "token")
       }
    private func navigateToInital(){
        let initalViewController = InitialViewController()
        navigationController?.pushViewController(initalViewController, animated: true)
        
    }
}
