//
//  MainMenuViewController.swift
//  ClickCounter
//
//  Created by juan ocampo on 5/19/20.
//  Copyright © 2020 juan ocampo. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    @IBAction func onPlaySoundSelected(_ sender: Any) {
        
        
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "PlaySoundsViewController") as! PlaySoundsViewController
        
        navigationController?.showDetailViewController(controller, sender: nil)
        
        
        
    }
}
