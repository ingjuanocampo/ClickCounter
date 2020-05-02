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
    var gameResult: GameResult?

    init(selectedOption: RashamboItem, rivalOption: RashamboItem) {
        self.selectedOption = selectedOption
        self.rivalOption = rivalOption
    }
    
    func calculateWinnerResults() {
        if selectedOption == rivalOption {
            gameResult = GameResult(gameStatus: .TIE, textResult: " Is a tie!", visualResourceResult: "itsATie")
        } else if selectedOption < rivalOption {
            let textResult = "\(selectedOption.getText()) wons over \(rivalOption.getText())"
            let visualResourceResult = selectedOption.getWinnerImage()
            gameResult = GameResult(gameStatus: .WON, textResult: textResult, visualResourceResult: visualResourceResult)
        } else {
            let textResult = "\(rivalOption.getText()) wons over \(selectedOption.getText())"
            let visualResourceResult = rivalOption.getWinnerImage()
            gameResult = GameResult(gameStatus: .LOSE, textResult: textResult, visualResourceResult: visualResourceResult)
        }
    }
   
}

func getRivalSelection() -> RashamboItem {
    let randomNumber = Int.random(in: 0 ... 2)
    let rashamboItem = RashamboItem(rawValue: randomNumber)
    return rashamboItem ?? RashamboItem.ROCK
}

struct GameResult {
    let gameStatus: GameStatus
    var textResult: String?
    var visualResourceResult: String?
}

enum GameStatus {
    case WON
    case LOSE
    case TIE
    
    func getText() -> String {
        var string: String

        switch self {
        case .WON:
            string = "You've won!."
        case .LOSE:
            string = "You've Lost."
        case .TIE:
            string = "It a tie."
        }
        return string
    }
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
