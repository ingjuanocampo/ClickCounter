//
//  DogAPI.swift
//  ClickCounter
//
//  Created by juan ocampo on 5/2/20.
//  Copyright © 2020 juan ocampo. All rights reserved.
//

import Foundation

class DogAPI {
    
    enum Endpoint: String {
        case randomImageFromAllDogsCollections = "https://dog.ceo/api/breeds/image/random"
        
        var url: URL {
            return URL(string: self.rawValue)!
        }
    }
    
    class func requestRandomImage(completionHanlder: @escaping (DogImage?, Error?)-> Void) {
        
        let randomImageEndpoint = DogAPI.Endpoint.randomImageFromAllDogsCollections.url
        
        let task = URLSession.shared.dataTask(with: randomImageEndpoint) {data,_,error in
            guard let data = data else {
                completionHanlder(nil, error)
                return
                
            }
            
            do {
                /*let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let url = json["message"] as! String
                self.imageView.showUrlImage(url: url) Classic serialization method*/
                
                let decoder = JSONDecoder()
                let dogImage = try decoder.decode(DogImage.self, from: data)
                
                completionHanlder(dogImage, nil)
            } catch {
                completionHanlder(nil, error)
            }
        }
        
        task.resume()
        
    }
    
}


