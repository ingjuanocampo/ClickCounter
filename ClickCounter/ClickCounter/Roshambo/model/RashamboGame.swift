//
//  RashamboGame.swift
//  ClickCounter
//
//  Created by juan ocampo on 4/9/20.
//  Copyright © 2020 juan ocampo. All rights reserved.
//

class RashamboGame {
    
    var selectedOption: RashamboItem
    var rivalOption: RashamboItem
    
    var textResult: String?
    var visualResourceResult: String?

    init(selectedOption: RashamboItem, rivalOption: RashamboItem) {
        self.selectedOption = selectedOption
        self.rivalOption = rivalOption
    }
    
    func calculateWinnerResults() {
        if selectedOption == rivalOption {
            textResult = " Is a tie!"
            visualResourceResult = "itsATie"
        } else if selectedOption < rivalOption {
            textResult = "\(selectedOption.getText()) wons over \(rivalOption.getText())"
            visualResourceResult = selectedOption.getWinnerImage()
        } else {
            textResult = "\(rivalOption.getText()) wons over \(selectedOption.getText())"
            visualResourceResult = rivalOption.getWinnerImage()
        }
    }
   
}

func getRivalSelection() -> RashamboItem {
    let randomNumber = Int.random(in: 0 ... 2)
    let rashamboItem = RashamboItem(rawValue: randomNumber)
    return rashamboItem ?? RashamboItem.ROCK
}

enum RashamboItem: Int, Comparable {
    case ROCK
    case SCISSORS
    case PAPPER
    
    static func < (lhs: RashamboItem, rhs: RashamboItem) -> Bool {
        if (lhs == .PAPPER && rhs == .ROCK) {
            return true
        } else if (lhs == .ROCK && rhs == .SCISSORS) {
            return true
        } else if (lhs == .SCISSORS && rhs == .PAPPER) {
            return true
        } else {
            return false
        }
    }
    
    func getWinnerImage() -> String {
        var string: String

        switch self {
        case .ROCK:
            string = "RockCrushesScissors"
        case .SCISSORS:
            string = "ScissorsCutPaper"
        case .PAPPER:
            string = "PaperCoversRock"
        }
        return string
    }
    
    func getText() -> String {
        var string: String
        switch self {
        case .ROCK:
            string = "Rock"
        case .SCISSORS:
            string = "Scissors"
        case .PAPPER:
            string = "Papper"
        }
        return string
    }
}
