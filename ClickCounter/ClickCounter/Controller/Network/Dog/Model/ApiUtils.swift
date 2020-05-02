//
//  ApiUtils.swift
//  ClickCounter
//
//  Created by juan ocampo on 5/2/20.
//  Copyright © 2020 juan ocampo. All rights reserved.
//

import Foundation


func requestImageFile(url: String, completionHandler: @escaping (Data?, Error?)-> Void) {
    
    guard let imageUrl = URL(string: url) else { return }
           let task = URLSession.shared.dataTask(with: imageUrl) { (data, resposne, erros) in
               guard let data = data else {
                completionHandler(nil, erros)
                return }
               
               DispatchQueue.main.async {
                   completionHandler(data, nil)
               }
           }
           task.resume()
    
}
