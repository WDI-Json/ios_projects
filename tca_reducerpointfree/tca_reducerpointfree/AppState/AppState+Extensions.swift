//
//  AppState+Extensions.swift
//  tca_reducerpointfree
//
//  Created by Wouter on 22/03/2023.
//

import Foundation
import PrimeModal

extension AppState {
    var primeModal: PrimeModalState {
        get {
            PrimeModalState(
                count: self.count,
                favoritePrimes: self.favoritePrimes
            )
        }
        set {
            self.count = newValue.count
            self.favoritePrimes = newValue.favoritePrimes
        }
    }
}
