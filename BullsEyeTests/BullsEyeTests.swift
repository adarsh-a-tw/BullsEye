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

    override func setUpWithError() throws {
        try super.setUpWithError()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateInitialViewController() as? GameViewController
        _ = sut.view
        
        sut.gameController = MockBullsEyeGame()
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
        sut.slider.value = 20.0
        let downcastedController = sut.gameController as! MockBullsEyeGame
        downcastedController.checkAndUpdateScoreMethodSideEffect = (title:"Test Title",message:"Test Message")
        
        sut.showAlert()
            
        XCTAssert(downcastedController.checkAndUpdateScoreMethodCalls[0] == [20])
    }
    

}
