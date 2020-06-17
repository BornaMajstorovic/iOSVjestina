//
//  Utilities.swift
//  QuizzApp
//
//  Created by Borna on 09/04/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import Foundation
import UIKit

class Utilites {
}

extension UIButton {
    
    static func styleButton(button: UIButton) {
        button.backgroundColor = #colorLiteral(red: 0.2117647059, green: 0.2705882353, blue: 0.4588235294, alpha: 0.5960776969)
        button.layer.cornerRadius = 20
        button.tintColor = #colorLiteral(red: 0.5328530073, green: 0.402020514, blue: 0.6997897029, alpha: 1)
    }
    
    static func styleButtonDisabled(button: UIButton) {
    
         button.backgroundColor = #colorLiteral(red: 0.2117647059, green: 0.2705882353, blue: 0.4588235294, alpha: 0.5960776969)
         button.layer.cornerRadius = 20
         button.tintColor = #colorLiteral(red: 0.5328530073, green: 0.402020514, blue: 0.6997897029, alpha: 1)
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
        
        bottomLine.backgroundColor = #colorLiteral(red: 0.2117647059, green: 0.2705882353, blue: 0.4588235294, alpha: 0.5)
        bottomLine.cornerRadius = 20
        
        // Remove border on text field
        textfield.borderStyle = .none
    
        
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
        
    }
}
