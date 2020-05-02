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


// Coding key example
/*
var json = """
{
    "food_name": "Lemon",
    "taste": "sour",
    "number of calories": 17
}
""".data(using: .utf8)!

struct Food: Codable {
    let name: String
    let taste: String
    let calories: Int
    
    enum CodingKeys: String, CodingKey {
        case name = "food_name"
        case taste = "taste"
        case calories = "number of calories"
    }
}

let decoder = JSONDecoder()

do {
    let food = try decoder.decode(Food.self, from: json)
    print(food)
} catch {
    print(error)
}
 */


/* Arraly objects
var json = """
[
    {
        "title": "Groundhog Day",
        "released": 1993,
        "starring": ["Bill Murray", "Andie MacDowell", "Chris Elliot"]
    },
    {
        "title": "Home Alone",
        "released": 1990,
        "starring": ["Macaulay Culkin", "Joe Pesci", "Daniel Stern", "John Heard", "Catherine O'Hara"]
    }
]
""".data(using: .utf8)!

struct Movie: Codable {
    let title: String
    let released: Int
    let starring: [String]
}

let decoder = JSONDecoder()

do {
    
    let comedies = try decoder.decode([Movie].self, from: json)
    print(comedies)
} catch {
    print(error)
}
 
 */


