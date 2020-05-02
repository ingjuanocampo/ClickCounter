//
//  DogRandomImageViewController.swift
//  ClickCounter
//
//  Created by juan ocampo on 5/2/20.
//  Copyright © 2020 juan ocampo. All rights reserved.
//

import UIKit


class DogRandomImageViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        DogAPI.requestRandomImage { (dogImage, error) in
            guard let dogImage = dogImage else {
                print(error?.localizedDescription ?? "Error accessing service" )
                return
            }
            self.imageView.showUrlImage(url: dogImage.message ?? "")
        }
    }
    
}

