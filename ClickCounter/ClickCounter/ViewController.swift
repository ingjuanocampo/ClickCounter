//
//  ViewController.swift
//  ClickCounter
//
//  Created by juan ocampo on 4/4/20.
//  Copyright © 2020 juan ocampo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label : UILabel? = nil
    var count = 0
    var colorToogle = false

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @objc
    func changeBckView() {
        var color: UIColor = .cyan
        if colorToogle {
            color = .magenta
        }
        colorToogle = !colorToogle
        view.backgroundColor = color
    }
    
    @IBAction
    func increamentCount() {
        self.count += 1
        self.label?.text = "\(self.count)"
    }

    @objc
    func decreamentCount() {
        self.count -= 1
        self.label?.text = "\(self.count)"
    }


}

