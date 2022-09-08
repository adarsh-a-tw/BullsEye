//
//  BullsEyeGame.swift
//  BullsEye
//
//  Created by Adarsh A on 05/09/22.
//

import Foundation


class BullsEyeGame: Game {
    
    var score:Int = 0
    var round:Int = 0
    var targetValue:Int = 50
    var integerGenerator: IntegerGenerator = DefaultRandomIntegerGenerator()
    
    func startNewGame(){
        score = 0
        round = 0
        startNewRound()
    }
    
    func startNewRound(){
        round += 1
        targetValue = integerGenerator.generate()
    }
    
    
    func checkAndUpdateScore(guess:Int)->(title:String,message:String){
        let difference = (targetValue - guess).magnitude
        
        switch(difference){
        case 0:
            score += 200
            return ("Bull's Eye!","200 points")
        case 1...5:
            score += 100
            return ("Almost there!","100 points")
        case 6...10:
            score += 50
            return ("You are close!","50 points")
        default:
            return ("Too far!","Try again")
        }
    }
    
}

