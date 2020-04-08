//
//  NavigationController.swift
//  ClickCounter
//
//  Created by juan ocampo on 4/7/20.
//  Copyright © 2020 juan ocampo. All rights reserved.
//

import Foundation

import UIKit

class NavigationController: UIViewController {
    
    
    @IBAction func onNavigationPressed(_ sender: UIButton) {
        let nextUIController = UIImagePickerController()
        present(nextUIController, animated: true, completion: nil)
    }
    
    
    @IBAction func onDialogPressed(_ sender: UIButton) {
        
        let dialog = UIAlertController()
        dialog.title = "Dialog title"
        dialog.message = "This is a test"
        
        present(dialog, animated: true, completion: nil)
    }
    
}
