//
//  FavoritePrimesReducer.swift
//  tca_reducerpointfree
//
//  Created by Wouter on 10/03/2023.
//

import Foundation

public func favoritePrimesReducer(state: inout [Int], action: FavoritePrimesAction) {
    switch action {
    case let .deleteFavoritePrimes(indexSet):
        for index in indexSet {
            state.remove(at: index)
        }
    }
}
