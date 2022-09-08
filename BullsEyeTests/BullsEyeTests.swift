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
    var downcastedController: MockBullsEyeGameController!

    override func setUpWithError() throws {
        try super.setUpWithError()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateInitialViewController() as? GameViewController
        _ = sut.view
        
        sut.gameController = MockBullsEyeGameController()
        downcastedController = sut.gameController as? MockBullsEyeGameController
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut.gameController = nil
        sut = nil
        downcastedController = nil
    }

    func testShouldStartNewGame() throws {
        downcastedController.getgameStatsReturnValue = [.score:0, .round:1,.targetValue:50]
        
        sut.startNewGame()
        
        XCTAssert(downcastedController.startNewGameMethodCalls == 1)
        XCTAssert(downcastedController.getgameStatsMethodCalls == 1)
    }
    
    func testShouldStartNewRound() {
        downcastedController.getgameStatsReturnValue = [.score:0, .round:1,.targetValue:50]
        
        sut.startNewRound()
        
        XCTAssert(downcastedController.startNewRoundMethodCalls == 1)
        XCTAssert(downcastedController.getgameStatsMethodCalls == 1)
    }
    
    func testShouldCheckGuessAndDisplayAlert(){
        let guessValue = 20
        sut.slider.value = Float(guessValue)
        
        downcastedController.checkAndUpdateScoreMethodReturnValue = (title:"Test Title",message:"Test Message")
        
        sut.handleHitMeButtonClick()
            
        XCTAssert(downcastedController.checkAndUpdateScoreMethodCalls[0].first == guessValue)
    }
    

}
