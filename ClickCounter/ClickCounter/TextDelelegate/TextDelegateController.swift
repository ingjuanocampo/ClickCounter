//
//  TextDelegateController.swift
//  ClickCounter
//
//  Created by juan ocampo on 4/10/20.
//  Copyright © 2020 juan ocampo. All rights reserved.
//

import UIKit

class TextDelegateController: UIViewController, UITextFieldDelegate {
    
    // MARK: Outlets
    @IBOutlet weak var textField1: UITextField?
    @IBOutlet weak var textField2: UITextField?
    @IBOutlet weak var textField3: UITextField?
    @IBOutlet weak var textField4: UITextField?
    
    @IBOutlet weak var textField5: UITextField?
    @IBOutlet weak var textField6: UITextField?
    @IBOutlet weak var textField7: UITextField?
    @IBOutlet weak var enableTextFieldSwich: UISwitch!
    
    
    @IBOutlet weak var characterCountLabel: UILabel!
    
    // MARK: Text Field Delegate objects
    let emojiDelegate = EmojiTextFieldDelegate()
    let colorizerDelegate = ColorizerTextFieldDelegate()
    let randomColorizerDelegate = RandomColorTextFieldDelegate()
    let zipcodeTextFieldDelegate = ZipcodeTextFieldDelegate()
    let cashTextFielDelegate = ChashTextFieldDelegate()
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set the label to be hidden
        self.characterCountLabel.isHidden = true
        
        // Set the three delegates
        self.textField1?.delegate = emojiDelegate
        self.textField2?.delegate = colorizerDelegate
        self.textField3?.delegate = self
        self.textField4?.delegate = randomColorizerDelegate
        self.textField5?.delegate = zipcodeTextFieldDelegate
        self.textField6?.delegate = cashTextFielDelegate
        self.textField7?.delegate = self
    }
    
    @IBAction func onDisableFieldSelected(_ sender: UISwitch) {
        if !(sender).isOn {
            self.textField7?.resignFirstResponder()
        }
    }
    
    
    // MARK: Text Field Delegate Methods
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if (textField == textField3) {
            // Figure out what the new text will be, if we return true
            var newText = textField.text! as NSString
            newText = newText.replacingCharacters(in: range, with: string) as NSString
            // hide the label if the newText will be an empty string
            self.characterCountLabel.isHidden = (newText.length == 0)
            
            // Write the length of newText into the label
            self.characterCountLabel.text = String(newText.length)
            
            // returning true gives the text field permission to change its text
        }
        return true;
    }
    
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        var shoudlEdit = true
        if (textField == textField7){
            shoudlEdit = self.enableTextFieldSwich.isOn
        }
        return shoudlEdit
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField == textField7){
            textField.resignFirstResponder()
        }
        
        return true;
    }
    
    // MARK: Actions
    
    
    
}


