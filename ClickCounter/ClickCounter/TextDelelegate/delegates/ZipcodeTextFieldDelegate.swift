//
//  ZipcodeTextFieldDelegate.swift
//  ClickCounter
//
//  Created by juan ocampo on 4/10/20.
//  Copyright © 2020 juan ocampo. All rights reserved.
//

import Foundation
import UIKit

class ZipcodeTextFieldDelegate : NSObject, UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var shoudlOverride = false
        
        if let count = textField.text?.count {
            shoudlOverride = count > 4
            if shoudlOverride {
                let newText = textField.text! as NSString
                textField.text = newText.substring(to: 4)
            }
        }
        return true
    }

}
