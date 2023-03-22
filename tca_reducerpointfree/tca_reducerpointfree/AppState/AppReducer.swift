//
//  CounterReducer.swift
//  tca_reducerpointfree
//
//  Created by Wouter on 09/03/2023.
//

import Foundation
import ComposableArchitecture
import FavoritePrimes
import Counter
import PrimeModal

let _appReducer: (inout AppState, AppAction) -> Void = combine(
    pullback(counterReducer, value: \.count, action: \.counter),
    pullback(primeModalReducer, value: \.primeModal, action: \.primeModal),
    pullback(favoritePrimesReducer, value: \.favoritePrimes, action: \.favoritePrimes)
)
let appReducer = pullback(_appReducer, value: \.self, action: \.self)

func activityFeed(
    _ reducer: @escaping (inout AppState, AppAction) -> Void
) -> (inout AppState, AppAction) -> Void {

    return { state, action in
        switch action {
        case .counter:
            break
        case .primeModal(.removeFavoritePrimeTapped):
            state.activityFeed.append(
                .init(timestamp: Date(), type: .removedFavoritePrime(state.count))
            )
        case .primeModal(.saveFavoritePrimeTapped):
            state.activityFeed.append(
                .init(timestamp: Date(), type: .addedFavoritePrime(state.count))
            )
        case let .favoritePrimes(.deleteFavoritePrimes(indexSet)):
            for index in indexSet {
                state.activityFeed.append(
                    .init(timestamp: Date(), type: .removedFavoritePrime(index)))
            }
        }
        reducer(&state, action)
    }
}

