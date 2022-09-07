//
//  BullsEyeGameTests.swift
//  BullsEyeGameTests
//
//  Created by Adarsh A on 05/09/22.
//

@testable import BullsEye

import XCTest

class BullsEyeGameTests: XCTestCase {
    
    var sut:BullsEyeGame!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = BullsEyeGame()
    }

    override func tearDownWithError() throws {
       try super.tearDownWithError()
       sut = nil
    }

    func testStartNewGame() {
        let initialTarget = sut.targetValue
        
        sut.integerGenerator = IntegerGeneratorStub() as IntegerGenerator
        sut.startNewGame()
        
        XCTAssert(sut.round == 1)
        XCTAssert(sut.score == 0)
        XCTAssert(initialTarget != sut.targetValue)
    }
    
    func testStartNewRound() {
        let initialTarget = sut.targetValue
        let initialRound = sut.round
        
        sut.integerGenerator = IntegerGeneratorStub() as IntegerGenerator
        sut.startNewRound()
        
        XCTAssert(initialTarget != sut.targetValue)
        XCTAssert(sut.round == initialRound + 1 )
        
    }
    
    func testAdd200ToScoreWhenGuessExact() {
        sut.startNewGame()
        let target = sut.targetValue
        
        let response:(title:String,message:String) = sut.checkAndUpdateScore(guess: target)
        
        XCTAssert(sut.score == 200)
        XCTAssert(response.title == "Bull's Eye!")
        XCTAssert(response.message == "200 points")
    }
    
    func testAdd0ToScoreWhenGuessTooFar() {
        sut.startNewGame()
        let target = sut.targetValue
        
        let response:(title:String,message:String) = sut.checkAndUpdateScore(guess: target+30)
        
        XCTAssert(sut.score == 0)
        XCTAssert(response.title == "Too far!")
        XCTAssert(response.message == "Try again")
    }
    
    func testAdd100ToScoreWhenGuessAlmostExact() {
        sut.startNewGame()
        let target = sut.targetValue
        
        let response:(title:String,message:String) = sut.checkAndUpdateScore(guess: target+5)
        
        XCTAssert(sut.score == 100)
        XCTAssert(response.title == "Almost there!")
        XCTAssert(response.message == "100 points")
    }
    
    func testAdd50ToScoreWhenGuessNearExact() {
        sut.startNewGame()
        let target = sut.targetValue
        
        let response:(title:String,message:String) = sut.checkAndUpdateScore(guess: target+10)
        
        XCTAssert(sut.score == 50)
        XCTAssert(response.title == "You are close!")
        XCTAssert(response.message == "50 points")
    }
}
