//
//  GamePlay.swift
//  ClickCounter
//
//  Created by juan ocampo on 4/16/20.
//  Copyright © 2020 juan ocampo. All rights reserved.
//

import Foundation


class GamePlay {
    
    var history = Array<GameResult>()
    
    
    static var instance: GamePlay? = nil
    
    static func getGamePlayInstance() -> GamePlay {
        if (instance == nil) {
            instance = GamePlay()
        }
        return instance!
    }
}




