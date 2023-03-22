//
//  PrimeModalState.swift
//  PrimeModal
//
//  Created by Wouter on 22/03/2023.
//

import Foundation

public struct PrimeModalState {
    public var count: Int
    public var favoritePrimes: [Int]

    public init(count: Int, favoritePrimes: [Int]) {
        self.count = count
        self.favoritePrimes = favoritePrimes
    }
}
