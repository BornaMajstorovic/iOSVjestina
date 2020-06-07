//
//  QuizzFooterView.swift
//  QuizzApp
//
//  Created by Borna on 01/06/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import UIKit

class QuizzFooterView: UIView {

    var logoutButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.lightText
        logoutButton = UIButton()
        logoutButton.setTitle("logout", for: .normal)
        logoutButton.setTitleColor(.black, for: .normal)
        logoutButton.addTarget(self, action: #selector(QuizzFooterView.logoutButtonTapped(_:)), for: UIControl.Event.touchUpInside)
        
        self.addSubview(logoutButton)
        logoutButton.autoCenterInSuperview()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func logoutButtonTapped(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "token")
        UserDefaults.standard.removeObject(forKey: "userId")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window!.rootViewController = LoginViewController()
    }
    
    
    
}
