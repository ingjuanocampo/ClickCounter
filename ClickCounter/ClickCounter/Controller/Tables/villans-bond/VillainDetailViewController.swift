//
//  VillainDetailViewController.swift
//  ClickCounter
//
//  Created by juan ocampo on 4/19/20.
//  Copyright © 2020 juan ocampo. All rights reserved.
//

import Foundation
import UIKit


class VillainDetailViewController: UIViewController {
    
    @IBOutlet weak var villianImage: UIImageView?
    @IBOutlet weak var villianName: UILabel?
    @IBOutlet weak var villianEvil: UILabel?
    var villian: Villain? = nil
    
    override func viewDidLoad() {
        villianImage?.image = UIImage(named: villian?.imageName ?? "")
        villianName?.text = villian?.name
        villianEvil?.text = villian?.evilScheme
    }
    
}
