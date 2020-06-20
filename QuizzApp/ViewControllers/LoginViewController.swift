//
//  LoginViewController.swift
//  QuizzApp
//
//  Created by Borna on 09/05/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import UIKit
import QuartzCore

final class LoginViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet private weak var usernameTF: UITextField!
    @IBOutlet private weak var passwordTF: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: Properties
    private var  loginModel: LoginModel?

    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareForAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateEverythingIn()
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
                    self.animateEverythingOut()
                case .failure(let err):
                    print("Fail:", err)
                    //labela il alert
                }
            }
        }
    }
    
    private func prepareForAnimation(){
        titleLabel.transform = CGAffineTransform(scaleX: 0, y: 0)
        usernameTF.transform = CGAffineTransform(translationX: -view.bounds.width, y: 0)
        usernameTF.alpha = 0
        passwordTF.transform = CGAffineTransform(translationX: -view.bounds.width, y: 0)
        passwordTF.alpha = 0
        loginButton.transform = CGAffineTransform(translationX: -view.bounds.width, y: 0)
        loginButton.alpha = 0
    }
    
    private func animateEverythingIn(){
        UIView.animate(withDuration: 1, delay: 0, animations: {
            self.titleLabel.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }) { _ in
        }

        UIView.animate(withDuration: 0.3, animations:  {
            self.usernameTF.transform = CGAffineTransform.identity
            self.usernameTF.alpha = 1
        }) { _ in
        }
        UIView.animate(withDuration: 0.6, animations:  {
            self.passwordTF.transform = CGAffineTransform.identity
            self.passwordTF.alpha = 1
        }) { _ in
        }
        UIView.animate(withDuration: 0.9, animations:  {
            self.loginButton.transform = CGAffineTransform.identity
            self.loginButton.alpha = 1
        }) { _ in
        }
        
    }
  
    
    private func animateEverythingOut(){
        UIView.animate(withDuration: 0.3,  animations: {
            self.titleLabel.transform = CGAffineTransform(translationX: 0, y: -self.view.bounds.height)
        }) { _ in
        }

        UIView.animate(withDuration: 0.3, animations:  {
            self.usernameTF.transform = CGAffineTransform(translationX: 0, y: -self.view.bounds.height)
            self.usernameTF.alpha = 0
        }) { _ in
        }
        UIView.animate(withDuration: 0.6, animations:  {
            self.passwordTF.transform = CGAffineTransform(translationX: 0, y: -self.view.bounds.height)
            self.passwordTF.alpha = 0
        }) { _ in
        }
        UIView.animate(withDuration: 0.9, animations:  {
            self.loginButton.transform = CGAffineTransform(translationX: 0, y: -self.view.bounds.height)
            self.loginButton.alpha = 0
        }) { _ in
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            UserCredentialsAndNavigation.shared.showTabBarVC()
        }
        
    }
    
    

    private func saveCredentials(loginModel: LoginModel) {
           UserDefaults.standard.set(loginModel.userId, forKey: "userId")
           UserDefaults.standard.set(loginModel.token, forKey: "token")
        UserDefaults.standard.set(usernameTF.text, forKey: "username")
       }
    
   
   
    private func setUpView(){
        navigationItem.title = "Login"
        self.view.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.8901960784, blue: 0.6549019608, alpha: 1)
        titleLabel.layer.cornerRadius = 5
        titleLabel.layer.masksToBounds = true
        UITextField.styleTextField(textfield: usernameTF)
        UITextField.styleTextField(textfield: passwordTF)
        UIButton.styleButton(button: loginButton)
    }
    
 
}
 
