//
//  RoshamboSelectorController.swift
//  ClickCounter
//
//  Created by juan ocampo on 4/8/20.
//  Copyright © 2020 juan ocampo. All rights reserved.
//

import UIKit

class RoshamboSelectorController: UIViewController {

    var game : RashamboGame? = nil
    var gamePlay = GamePlay.getGamePlayInstance()

    @IBAction func onRockSelected(_ sender: Any) {
        game = RashamboGame(selectedOption: .ROCK, rivalOption:  getRivalSelection())
        
        game?.calculateWinnerResults()
        if let gameResult = game?.gameResult {
            gamePlay.history.append(gameResult)
        }
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "RoshamboResultController") as! RoshamboResultController
        
        controller.resultImageRef = game?.gameResult?.visualResourceResult ?? ""
        controller.textResult = game?.gameResult?.textResult ?? ""
                
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func onScissorsSelected(_ sender: Any) {
        game = RashamboGame(selectedOption: .SCISSORS, rivalOption:  getRivalSelection())
        
        game?.calculateWinnerResults()
        if let gameResult = game?.gameResult {
            gamePlay.history.append(gameResult)
        }
        
        performSegue(withIdentifier: "scissorsSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is RoshamboResultController {
            let controller = segue.destination as! RoshamboResultController
            
            if (segue.identifier == "papperSegue") {

                game = RashamboGame(selectedOption: .PAPPER, rivalOption:  getRivalSelection())
                game?.calculateWinnerResults()
                if let gameResult = game?.gameResult {
                    gamePlay.history.append(gameResult)
                }
            }

            controller.resultImageRef = game?.gameResult?.visualResourceResult ?? ""
            controller.textResult = game?.gameResult?.textResult ?? ""
            
        } else if segue.destination is GamePlayHistoryController {
            let controller = segue.destination as! GamePlayHistoryController
            controller.history = gamePlay.history
        }
    
    }

}
