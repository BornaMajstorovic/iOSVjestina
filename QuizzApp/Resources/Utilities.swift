//
//  Utilities.swift
//  QuizzApp
//
//  Created by Borna on 09/04/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

extension UIButton {
    
    static func styleButton(button: UIButton) {
        button.backgroundColor = #colorLiteral(red: 0.5328530073, green: 0.402020514, blue: 0.6997897029, alpha: 1)
        button.layer.cornerRadius = 20
        button.tintColor = #colorLiteral(red: 0.9703171849, green: 0.7819978595, blue: 0.3436401486, alpha: 1)
    }
    
    static func styleButtonDisabled(button: UIButton) {
    
         button.backgroundColor = #colorLiteral(red: 0.5333333333, green: 0.4039215686, blue: 0.6980392157, alpha: 1)
         button.layer.cornerRadius = 20
         button.tintColor = #colorLiteral(red: 0.9703171849, green: 0.7819978595, blue: 0.3436401486, alpha: 1)
         button.isEnabled = false
     }
     
    static func styleButtonEnabled(button: UIButton) {
         button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
         button.layer.cornerRadius = 20
         button.tintColor = #colorLiteral(red: 0.5328530073, green: 0.402020514, blue: 0.6997897029, alpha: 1)
         button.isEnabled = true
     }
}
extension UITextField {
    static func styleTextField(textfield: UITextField) {
        // Create the bottom line
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        
        bottomLine.backgroundColor = #colorLiteral(red: 0.5328530073, green: 0.402020514, blue: 0.6997897029, alpha: 1)
        bottomLine.cornerRadius = 20
        
        // Remove border on text field
        textfield.borderStyle = .none
    
        
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
        
    }
}

extension UIViewController {
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
}

extension UILabel {
    static func styleLabel(label: UILabel){
        label.backgroundColor = #colorLiteral(red: 0.5328530073, green: 0.402020514, blue: 0.6997897029, alpha: 1)
        label.textColor = #colorLiteral(red: 0.9703171849, green: 0.7819978595, blue: 0.3436401486, alpha: 1)
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
    }
}
