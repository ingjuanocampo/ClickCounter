//
//  NetworkExamplesViewController.swift
//  ClickCounter
//
//  Created by juan ocampo on 5/1/20.
//  Copyright © 2020 juan ocampo. All rights reserved.
//

import UIKit
import Foundation

class NetworkExercicesViewController: UIViewController {
        
    enum KittenImageLocation: String {
        case http = "http://www.kittenswhiskers.com/wp-content/uploads/sites/23/2014/02/Kitten-playing-with-yarn.jpg"
        case https = "https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Kitten_in_Rizal_Park%2C_Manila.jpg/460px-Kitten_in_Rizal_Park%2C_Manila.jpg"
        case error = "not a url"
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func onRequestPressed(_ sender: Any) {
        
        guard let imageUrl = URL(string: KittenImageLocation.http.rawValue) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: imageUrl) { (data, resposne, erros) in
            guard let data = data else { return }
            
            guard let image = UIImage(data: data) else {
                return
            }
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
        
        task.resume()
        
    
    }
}
