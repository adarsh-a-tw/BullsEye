//
//  DefaultIntegerGenerator.swift
//  BullsEye
//
//  Created by Adarsh A on 07/09/22.
//

import Foundation

struct DefaultRandomIntegerGenerator: IntegerGenerator {
    func generate() -> Int {
        Int.random(in: 1...100)
    }
}
