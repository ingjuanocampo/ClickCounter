

import Foundation
import UIKit


class DiceViewController: UIViewController {

    
    var firstValue: Int?
    var secondValue: Int?
    
    
    @IBOutlet var firstDie: UIImageView!
    @IBOutlet var secondDie: UIImageView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        // The dice will only appear if firstValue and secondValue have been set
        if let firstValue = self.firstValue {
            self.firstDie.image = UIImage(named: "d\(firstValue)")
        } else {
            self.firstDie.image = nil;
        }
        
        if let secondValue = self.secondValue {
            self.secondDie.image = UIImage(named: "d\(secondValue)")
        } else {
            self.secondDie.image = nil
        }
        
        self.firstDie.alpha = 0
        self.secondDie.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.3) {
            self.firstDie.alpha = 1
            self.secondDie.alpha = 1
        }
    }
    

    func imageForValue(_ value: Int?) -> UIImage? {
        return nil
    }
    
    @IBAction func dimiss(_ sender: Any) {
        dismiss()
    }
    

    private func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
}
