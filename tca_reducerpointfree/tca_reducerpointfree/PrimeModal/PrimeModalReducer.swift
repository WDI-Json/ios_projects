//
//  PrimeModalReducer.swift
//  tca_reducerpointfree
//
//  Created by Wouter on 10/03/2023.
//

import Foundation

func primeModalReducer(state: inout AppState, action: PrimeModalAction) {
    switch action {
    case .saveFavoritePrimeTapped:
        state.favoritePrimes.append(state.count)

    case .removeFavoritePrimeTapped:
        state.favoritePrimes.removeAll(where: { $0 == state.count })
    }
}
