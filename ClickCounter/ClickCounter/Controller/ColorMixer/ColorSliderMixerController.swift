//
//  ColorSliderMixerController.swift
//  ClickCounter
//
//  Created by juan ocampo on 4/7/20.
//  Copyright © 2020 juan ocampo. All rights reserved.
//

import Foundation

import UIKit


class ColorSliderMixerController: UIViewController {
    
        
    @IBOutlet weak var colorView: UIView?
    @IBOutlet weak var redControl: UISlider?
    @IBOutlet weak var greenControl: UISlider?
    @IBOutlet weak var blueControl: UISlider?

    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set colorView on launch
        changeColorComponent()
    }
    
    // MARK: Actions
    
    @IBAction func changeColorComponent() {
        
        // Make sure the program doesn't crash if the controls aren't connected
        if self.redControl == nil {
            return
        }
        
        
        
        let r: CGFloat = CGFloat(self.redControl?.value ?? 0.0)
        
        
        
        let g: CGFloat = CGFloat(self.greenControl?.value ?? 0.0)
        let b: CGFloat = CGFloat(self.blueControl?.value ?? 0.0)
                
        colorView?.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
    }
    
}
