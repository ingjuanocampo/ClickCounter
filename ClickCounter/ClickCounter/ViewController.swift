//
//  ViewController.swift
//  ClickCounter
//
//  Created by juan ocampo on 4/4/20.
//  Copyright © 2020 juan ocampo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var label : UILabel? = nil
    var count = 0
    var colorToogle = false

    override func viewDidLoad() {
        super.viewDidLoad()
        buildUpUI()
    }
    
    private func buildUpUI() {
        // Label
        label = UILabel()
        let cgRec = CGRect(x: 150, y: 150, width: 60, height: 60)
        label?.frame = cgRec
        label?.text = "0"
        if let label = label {
            view.addSubview(label)
        } else {
            print("cant add null labal")
        }
        
        // Button
        let button = UIButton()
        button.frame = CGRect(x: 150, y: 200, width: 100, height: 60)
        button.setTitle("Increase", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        view.addSubview(button)
        button.addTarget(self, action: #selector(ViewController.increamentCount), for: .touchUpInside)
        
        // Button
        let buttonDecement = UIButton()
        buttonDecement.frame = CGRect(x: 150, y: 300, width: 100, height: 60)
        buttonDecement.setTitle("Decrease", for: .normal)
        buttonDecement.setTitleColor(.blue, for: .normal)
        view.addSubview(buttonDecement)
        buttonDecement.addTarget(self, action: #selector(ViewController.decreamentCount), for: .touchUpInside)
        
        
        // Button
        let changeBcgColor = UIButton()
        changeBcgColor.frame = CGRect(x: 100, y: 500, width: 200, height: 60)
        changeBcgColor.setTitle("Background color", for: .normal)
        changeBcgColor.setTitleColor(.darkGray, for: .normal)
        view.addSubview(changeBcgColor)
        changeBcgColor.addTarget(self, action: #selector(ViewController.changeBckView), for: .touchUpInside)
        
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
    
    @objc
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

