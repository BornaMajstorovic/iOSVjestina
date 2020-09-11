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
        button.setTitleColor(#colorLiteral(red: 0.9703171849, green: 0.7819978595, blue: 0.3436401486, alpha: 1), for: .normal)
    }
}
extension UITextField {
    static func styleTextField(textfield: UITextField) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        bottomLine.backgroundColor = #colorLiteral(red: 0.5328530073, green: 0.402020514, blue: 0.6997897029, alpha: 1)
        bottomLine.cornerRadius = 20
        textfield.borderStyle = .none
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
extension String{
    static func roundUpThatString(string: String) -> String?{
        if let number = Double(string) {
            return String(Double(round(1000*number)/1000))
        }
        return nil
    }
}
