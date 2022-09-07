//
//  BullsEyeTests.swift
//  BullsEyeTests
//
//  Created by Adarsh A on 05/09/22.
//

@testable import BullsEye

import XCTest

class BullsEyeTests: XCTestCase {
    
    var sut: GameViewController!
    let slider = UISlider()
    let roundLabel = UILabel()
    let scoreLabel = UILabel()
    let targetLabel = UILabel()

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = GameViewController()
        sut.gameController = MockBullsEyeGame()
       
        slider.value = 1
        sut.slider = slider
        
        
        sut.roundLabel = roundLabel
        sut.scoreLabel = scoreLabel
        sut.targetLabel = targetLabel
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut.gameController = nil
        sut = nil
    }

    func testShouldStartNewGame() throws {
        sut.startNewGame()
        
        let downcastedController = sut.gameController as! MockBullsEyeGame
        XCTAssert(downcastedController.startNewGameMethodCalls == 1)
       
    }
    
    func testShouldStartNewRound() {
        
        sut.startNewRound()
        
        let downcastedController = sut.gameController as! MockBullsEyeGame
        XCTAssert(downcastedController.startNewRoundMethodCalls == 1)
    }
    
    func testShouldCheckGuessAndDisplayAlert(){
      
        let downcastedController = sut.gameController as! MockBullsEyeGame
        downcastedController.checkAndUpdateScoreMethodSideEffect = (title:"Test Title",message:"Test Message")
        
        sut.showAlert()
            
        XCTAssert(downcastedController.checkAndUpdateScoreMethodCalls[0] == [1])
    }
    

}
