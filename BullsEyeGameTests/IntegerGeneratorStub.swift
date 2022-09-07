//
//  IntegerGeneratorStub.swift
//  BullsEyeGameTests
//
//  Created by Adarsh A on 07/09/22.
//

import Foundation

@testable import BullsEye

struct IntegerGeneratorStub: IntegerGenerator {
    
    var stubValue = 10
    
    func generate() -> Int {
        return stubValue
    }
}
