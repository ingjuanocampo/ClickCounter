//
//  ImageUtils.swift
//  ClickCounter
//
//  Created by juan ocampo on 5/2/20.
//  Copyright © 2020 juan ocampo. All rights reserved.
//

import Foundation
import UIKit


extension UIImageView {
    
    func showUrlImage(url: String) {
        requestImageFile(url: url) { (imageData, error) in
            guard let imageData = imageData else {
                print(error?.localizedDescription ?? "Error loading image")
                return
            }
            guard let image = UIImage(data: imageData) else {
                return
            }
            self.image = image
            
        }
    }
}
