//
//  RandomColorTextFieldDelegate.swift
//  ClickCounter
//
//  Created by juan ocampo on 4/10/20.
//  Copyright © 2020 juan ocampo. All rights reserved.
//

import Foundation
import UIKit

class RandomColorTextFieldDelegate:  NSObject, UITextFieldDelegate {

//    func randomColor() -> UIColor {
//        // @TODO: return a random color
//    }
    
    let colors:[UIColor] = [.red, .orange, .yellow, .green, .blue, .purple, .brown]

    
    func randomColor() -> UIColor {
        let randomIndex = Int(arc4random() % UInt32(colors.count))
        return colors[randomIndex]
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        textField.textColor = randomColor()

        return true
    }

}
