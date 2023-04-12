//
//  IsPrimeModalView.swift
//  PrimeModal
//
//  Created by Wouter on 12/04/2023.
//

import SwiftUI

import SwiftUI
import ComposableArchitecture

public struct IsPrimeModalView: View {
    @ObservedObject var store: Store<PrimeModalState, PrimeModalAction>

    public init(store: Store<PrimeModalState, PrimeModalAction>) {
        self.store = store
    }

    public var body: some View {
        VStack {
            if isPrime(self.store.value.count) {
                Text("\(self.store.value.count) is prime 🎉")
                if self.store.value.favoritePrimes.contains(self.store.value.count) {
                    Button("Remove from favorite primes") {
                        self.store.send(.removeFavoritePrimeTapped)
                    }
                } else {
                    Button("Save to favorite primes") {
                        self.store.send(.saveFavoritePrimeTapped)
                    }
                }
            } else {
                Text("\(self.store.value.count) is not prime :(")
            }
        }
    }
}
