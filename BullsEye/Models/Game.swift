//
//  GameController.swift
//  BullsEye
//
//  Created by Adarsh A on 05/09/22.
//

import Foundation

protocol Game {
    
    var score:Int{get set}
    var round:Int{get set}
    var targetValue:Int{get set}
    
    func startNewGame()
    func startNewRound()
    func checkAndUpdateScore(guess:Int)->(title:String,message:String)
}
