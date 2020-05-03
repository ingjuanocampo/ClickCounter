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

func executeRequest<T: Decodable>(endPoint: URL, completionHanlder: @escaping (T?, Error?)-> Void) {
              
       let task = URLSession.shared.dataTask(with: endPoint) { data,_,error in
           guard let data = data else {
               completionHanlder(nil, error)
               return
           }
           do {
               let decoder = JSONDecoder()
            let dogImage = try decoder.decode(T.self, from: data)
               
               completionHanlder(dogImage, nil)
           } catch {
               completionHanlder(nil, error)
           }
       }
       
       task.resume()
       
   }
