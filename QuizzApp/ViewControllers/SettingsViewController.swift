//
//  SettingsViewController.swift
//  QuizzApp
//
//  Created by Borna on 17/06/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var usernameValueLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    // MARK: Actions
    @IBAction func logoutTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 2,delay: 0, animations: {
            self.logoutButton.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        }){_ in
            UserCredentials.shared.deleteUser()
        }

        
    }
    
    // MARK: Class methods
    func setUpView() {
        UILabel.styleLabel(label: usernameLabel)
        UILabel.styleLabel(label: usernameValueLabel)
        usernameLabel.text = "Username: "
        self.view.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.8901960784, blue: 0.6549019608, alpha: 1)
        usernameValueLabel.text = UserDefaults.standard.string(forKey: "username")
        UIButton.styleButton(button: logoutButton)
        logoutButton.layer.cornerRadius = 0.5 * logoutButton.frame.width
        
        
    }
    
}

