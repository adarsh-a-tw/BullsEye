//
//  GameController.swift
//  BullsEye
//
//  Created by Adarsh A on 08/09/22.
//

import Foundation

class BullsEyeGameController : GameController {
    
    let game: BullsEyeGame = BullsEyeGame()
    var integerGenerator: IntegerGenerator = DefaultRandomIntegerGenerator()
    
    func startNewGame() {
        game.score = 0
        game.round = 0
        startNewRound()
    }
    
    func startNewRound() {
        game.round += 1
        game.targetValue = integerGenerator.generate()
    }
    
    
    func checkAndUpdateScore(guess:Int) -> (title:String,message:String) {
        let difference = (game.targetValue - guess).magnitude
        
        switch(difference) {
        case 0:
            game.score += 200
            return ("Bull's Eye!","200 points")
        case 1...5:
            game.score += 100
            return ("Almost there!","100 points")
        case 6...10:
            game.score += 50
            return ("You are close!","50 points")
        default:
            return ("Too far!","Try again")
        }
    }
    
    func getGameStats() -> [GameStats : Int] {
        [
            .round: game.round,
            .targetValue: game.targetValue,
            .score: game.score
        ]
    }
    
}
