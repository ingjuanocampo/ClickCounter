

import UIKit


class RollViewController: UIViewController {
    

    func randomDiceValue() -> Int {
        let randomValue = 1 + arc4random() % 6
        
        return Int(randomValue)
    }

    
    @IBAction func rollTheDice() {
        // This is the programmatically way to do it 
        /*var controller: DiceViewController
        
        controller = self.storyboard?.instantiateViewController(withIdentifier: "DiceViewController") as! DiceViewController
        
        controller.firstValue = self.randomDiceValue()
        controller.secondValue = self.randomDiceValue()
        
        present(controller, animated: true, completion: nil)*/
        
        performSegue(withIdentifier: "rollDice", sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
                
        if segue.identifier == "rollDice" {
            let controller = segue.destination as! DiceViewController

            controller.firstValue = randomDiceValue()
            controller.secondValue = randomDiceValue()
        }
        
    }
    
    
}

