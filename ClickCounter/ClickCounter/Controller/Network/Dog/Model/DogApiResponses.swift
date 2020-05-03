//
//  DogImage.swift
//  ClickCounter
//
//  Created by juan ocampo on 5/2/20.
//  Copyright © 2020 juan ocampo. All rights reserved.
//

import Foundation

struct DogImage: Codable {
    let status: String?
    let message: String?
}

struct BreedListResponse: Codable {
    let status: String?
    let message: [String: [String]]
}

struct BreedDogResponse: Codable {
    let status: String?
    let message: [String]?
}
