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
        
        let okAction = UIAlertAction(title: "ok", style: UIAlertAction.Style.default) {
            action in self.dismiss(animated: true, completion: nil)
               }

        dialog.addAction(okAction)
        
        present(dialog, animated: true, completion: nil)
    }
    
    @IBAction func onUimagePressed(_ sender: Any) {
        let image = UIImage()
        let controller = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        present(controller, animated: true, completion: nil)

    }
}
