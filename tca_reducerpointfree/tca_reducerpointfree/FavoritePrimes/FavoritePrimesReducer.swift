//
//  FavoritePrimesReducer.swift
//  tca_reducerpointfree
//
//  Created by Wouter on 10/03/2023.
//

import Foundation

func favoritePrimesReducer(state: inout FavoritePrimesState, action: FavoritePrimesAction) {
    switch action {
    case let .deleteFavoritePrimes(indexSet):
        for index in indexSet {
            let prime = state.favoritePrimes[index]
            state.favoritePrimes.remove(at: index)
            state.activityFeed.append(
                .init(timestamp: Date(), type: .removedFavoritePrime(prime)))
        }
    }
}

