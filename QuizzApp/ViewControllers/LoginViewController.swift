//
//  LoginViewController.swift
//  QuizzApp
//
//  Created by Borna on 09/05/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet private weak var usernameTF: UITextField!
    @IBOutlet private weak var passwordTF: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    
    // MARK: Properties
    private var  loginModel: LoginModel?
    
    
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    // MARK: Actions
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        loginAndNavigateToInital()
    }
    
    
    // MARK: Class methods
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
                    print("Fail:", err)
                }
            }
        }
    }

    private func saveCredentials(loginModel: LoginModel) {
           UserDefaults.standard.set(loginModel.userId, forKey: "userId")
           UserDefaults.standard.set(loginModel.token, forKey: "token")
       }
    
    private func navigateToInital(){
        let initalViewController = InitialViewController(nibName: "InitialViewController", bundle: nil)
        navigationController?.pushViewController(initalViewController, animated: true)
    }
    
    private func setUpView(){
        Utilites.styleTextField(textfield: usernameTF)
        Utilites.styleTextField(textfield: passwordTF)
        Utilites.styleButton(button: loginButton)
    }
    
 
}
