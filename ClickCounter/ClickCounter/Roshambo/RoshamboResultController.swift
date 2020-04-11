//
//  RoshamboResultController.swift
//  ClickCounter
//
//  Created by juan ocampo on 4/8/20.
//  Copyright © 2020 juan ocampo. All rights reserved.
//

import UIKit

class RoshamboResultController: UIViewController {
    
    var resultImageRef: String?
    var textResult: String?
    
    @IBOutlet weak var resultImage: UIImageView?
    @IBOutlet weak var resultLabel: UILabel?
    
    override func viewDidLoad() {
        
        if let resultImageRef = resultImageRef {
            resultImage?.image = UIImage(named: "\(resultImageRef)")
        }
        
        if let textResult = textResult {
            resultLabel?.text = textResult
        }
        
    }
    
    
    @IBAction func playBackPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
