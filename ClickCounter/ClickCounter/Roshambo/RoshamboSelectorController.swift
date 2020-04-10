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

    @IBAction func onRockSelected(_ sender: Any) {
        game = RashamboGame(selectedOption: .ROCK, rivalOption:  getRivalSelection())
        
        game?.calculateWinnerResults()
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "RoshamboResultController") as! RoshamboResultController
        
        controller.resultImageRef = game?.visualResourceResult ?? ""
        controller.textResult = game?.textResult ?? ""
        
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func onScissorsSelected(_ sender: Any) {
        game = RashamboGame(selectedOption: .SCISSORS, rivalOption:  getRivalSelection())
        
        game?.calculateWinnerResults()
        
        performSegue(withIdentifier: "scissorsSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.destination is RoshamboResultController {
            let controller = segue.destination as! RoshamboResultController
            
            if (segue.identifier == "papperSegue") {

                game = RashamboGame(selectedOption: .PAPPER, rivalOption:  getRivalSelection())
                game?.calculateWinnerResults()
            }

            controller.resultImageRef = game?.visualResourceResult ?? ""
            controller.textResult = game?.textResult ?? ""
            
            
        }
    
        
    }
    
    
    
    
    
    

}
