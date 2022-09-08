//
//  BullsEyeGameTests.swift
//  BullsEyeGameTests
//
//  Created by Adarsh A on 08/09/22.
//

@testable import BullsEye

import XCTest

class BullsEyeGameControllerTests: XCTestCase {
    
    var sut:BullsEyeGameController!
    var game:BullsEyeGame!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = BullsEyeGameController()
        game = sut.game
    }

    override func tearDownWithError() throws {
       try super.tearDownWithError()
       sut = nil
    }

    func testStartNewGame() {
        let initialTarget = game.targetValue
        
        sut.integerGenerator = IntegerGeneratorStub() as IntegerGenerator
        sut.startNewGame()
        
        XCTAssert(game.round == 1)
        XCTAssert(game.score == 0)
        XCTAssert(initialTarget != game.targetValue)
    }
    
    func testStartNewRound() {
        let initialTarget = game.targetValue
        let initialRound = game.round
        
        sut.integerGenerator = IntegerGeneratorStub() as IntegerGenerator
        sut.startNewRound()
        
        XCTAssert(initialTarget != game.targetValue)
        XCTAssert(game.round == initialRound + 1 )
        
    }
    
    func testAdd200ToScoreWhenGuessExact() {
        sut.startNewGame()
        let target = game.targetValue
        
        let response:(title:String,message:String) = sut.checkAndUpdateScore(guess: target)
        
        XCTAssert(game.score == 200)
        XCTAssert(response.title == "Bull's Eye!")
        XCTAssert(response.message == "200 points")
    }
    
    func testAdd0ToScoreWhenGuessTooFar() {
        sut.startNewGame()
        let target = game.targetValue
        
        let response:(title:String,message:String) = sut.checkAndUpdateScore(guess: target+30)
        
        XCTAssert(game.score == 0)
        XCTAssert(response.title == "Too far!")
        XCTAssert(response.message == "Try again")
    }
    
    func testAdd100ToScoreWhenGuessAlmostExact() {
        sut.startNewGame()
        let target = game.targetValue
        
        let response:(title:String,message:String) = sut.checkAndUpdateScore(guess: target+5)
        
        XCTAssert(game.score == 100)
        XCTAssert(response.title == "Almost there!")
        XCTAssert(response.message == "100 points")
    }
    
    func testAdd50ToScoreWhenGuessNearExact() {
        sut.startNewGame()
        let target = game.targetValue
        
        let response:(title:String,message:String) = sut.checkAndUpdateScore(guess: target+10)
        
        XCTAssert(game.score == 50)
        XCTAssert(response.title == "You are close!")
        XCTAssert(response.message == "50 points")
    }
    
    func testGetGameStats() {
        sut.startNewGame()
        let round = game.round, score = game.score, targetValue = game.targetValue
        
        let stats: [GameStats:Int] = sut.getGameStats()
        
        XCTAssert(round == stats[.round])
        XCTAssert(score == stats[.score])
        XCTAssert(targetValue == stats[.targetValue])
    }
}
