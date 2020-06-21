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
        
        backgroundColor = #colorLiteral(red: 0.5328530073, green: 0.402020514, blue: 0.6997897029, alpha: 1)
        logoutButton = UIButton()
        logoutButton.setTitle("logout", for: .normal)
        logoutButton.setTitleColor(#colorLiteral(red: 0.9703171849, green: 0.7819978595, blue: 0.3436401486, alpha: 1), for: .normal)
        logoutButton.addTarget(self, action: #selector(QuizzFooterView.logoutButtonTapped(_:)), for: UIControl.Event.touchUpInside)
        
        self.addSubview(logoutButton)
        logoutButton.autoCenterInSuperview()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func logoutButtonTapped(_ sender: UIButton) {
        UserCredentials.shared.deleteUser()
    }
    
    
    
}
