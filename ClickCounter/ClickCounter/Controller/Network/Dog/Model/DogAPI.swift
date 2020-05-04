//
//  DogAPI.swift
//  ClickCounter
//
//  Created by juan ocampo on 5/2/20.
//  Copyright © 2020 juan ocampo. All rights reserved.
//

import Foundation

class DogAPI {
    
    enum Endpoint {
        
        case randomImageFromAllDogsCollections
        case randomImageForBreed(String)
        case listAllBreeds
        
        var url: URL {
            return URL(string: self.stringValue)!
        }
        
        var stringValue: String {
            switch self {
            case .randomImageFromAllDogsCollections:
                return "https://dog.ceo/api/breeds/image/random"
            case .randomImageForBreed(let breed):
                return "https://dog.ceo/api/breed/\(breed)/images"
            case .listAllBreeds:
                return "https://dog.ceo/api/breeds/list/all"
            }
        }
    }
    
    class func getAllBreeds(completionHanlder: @escaping ([String]?, Error?) -> Void) {
                
        func mapResponse(breedListResponse: BreedListResponse?, error: Error?) {
            guard let breedListResponse = breedListResponse else {
                completionHanlder(nil, error)
                return
            }
            let breedList = breedListResponse.message.keys.map({ key in return key })
            completionHanlder(breedList, nil)
        }
        executeRequest(endPoint: Endpoint.listAllBreeds.url, completionHanlder: mapResponse(breedListResponse:error:))
    }
    
    class func requestRandomImage(completionHanlder: @escaping (DogImage?, Error?)-> Void) {
        executeRequest(endPoint: DogAPI.Endpoint.randomImageFromAllDogsCollections.url,
                     completionHanlder: completionHanlder)
    }
    
    class func requestBreedImage(breed: String, completionHanlder: @escaping (BreedDogResponse?, Error?)-> Void) {
        executeRequest(endPoint: DogAPI.Endpoint.randomImageForBreed(breed).url,
                          completionHanlder: completionHanlder)
        
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


