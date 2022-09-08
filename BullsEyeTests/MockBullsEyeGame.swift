//
//  MockBullsEyeGame.swift
//  BullsEye
//
//  Created by Adarsh A on 05/09/22.
//

import Foundation
@testable import BullsEye

class MockBullsEyeGameController: GameController {

    var startNewGameMethodCalls = 0
    var startNewRoundMethodCalls = 0
    var checkAndUpdateScoreMethodCalls: [[Int]] = []
    var checkAndUpdateScoreMethodReturnValue: (title: String, message: String)? = nil
    var getgameStatsMethodCalls = 0
    var getgameStatsReturnValue: [GameStats:Int]? = nil

    func startNewGame() {
        startNewGameMethodCalls += 1
    }

    func startNewRound() {
        startNewRoundMethodCalls += 1
    }

    func checkAndUpdateScore(guess: Int) -> (title: String, message: String) {
        checkAndUpdateScoreMethodCalls.append([guess])

        if let returnValue = checkAndUpdateScoreMethodReturnValue {
            return returnValue
        }
        return (title:"",message:"")
    }
    
    func getGameStats() -> [GameStats : Int] {
        getgameStatsMethodCalls += 1
        
        if let returnValue = getgameStatsReturnValue {
            return returnValue
        }
        return [:]
    }

}
