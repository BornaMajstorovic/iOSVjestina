//
//  SettingsViewController.swift
//  QuizzApp
//
//  Created by Borna on 17/06/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var usernameValueLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }


    @IBAction func logoutTapped(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "token")
        UserDefaults.standard.removeObject(forKey: "userId")
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
            appDelegate.window!.rootViewController = LoginViewController()
        }
    }
    
    func setUpView() {
        usernameLabel.text = "Username: "
        usernameValueLabel.text = UserDefaults.standard.string(forKey: "username")
        logoutButton.layer.cornerRadius = 0.5 * logoutButton.frame.width
        logoutButton.backgroundColor = #colorLiteral(red: 0.5328530073, green: 0.402020514, blue: 0.6997897029, alpha: 1)
        logoutButton.setTitleColor(#colorLiteral(red: 0.9703171849, green: 0.7819978595, blue: 0.3436401486, alpha: 1), for: .normal)
        
    }
    
}

