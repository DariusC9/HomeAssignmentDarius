//
//  Generator.swift
//  HomeAssignmentDarius
//
//  Created by Darius Couti on 10.12.2023.
//

import Foundation

struct Generator {
    
    static func generateRandomNumber() -> Int {
        let lowerBound = 1000000
        let upperBound = 9999999
        let randomNumber = Int(arc4random_uniform(UInt32(upperBound - lowerBound + 1))) + lowerBound
        return randomNumber
    }
}
