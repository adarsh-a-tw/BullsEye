//
//  GameController.swift
//  BullsEye
//
//  Created by Adarsh A on 08/09/22.
//

import Foundation

protocol GameController {
    
    func startNewGame()
    func startNewRound()
    func checkAndUpdateScore(guess:Int) -> (title:String,message:String)
    func getGameStats() -> [GameStats: Int]
}
