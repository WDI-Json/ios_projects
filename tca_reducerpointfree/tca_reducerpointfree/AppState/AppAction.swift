//
//  CounterrAction.swift
//  tca_reducerpointfree
//
//  Created by Wouter on 09/03/2023.
//

import Foundation

///Makes it possible to generate keyPaths
/// let someAction = AppAction.counter(.incrTapped)
/// someAction.counter
/// someAction.favoritePrimes
/// \AppAction.counter
///
/// Basically WritableKeyPath<AppAction, CounterAction?>
/// With this we can create action pullbacks
/// The only real downside and cost to this style of architecture is that we needed to turn to a bit of code generation to have key paths for each case of our action enums. We agree that this is not ideal, but really we are just doing code generation to make up for the imbalance between structs and enums in Swift. We consider this to be one of the more innocent uses of code generation because it is solving a serious deficiency in Swift’s data types, and hopefully someday Swift will fix this imbalance between structs and enums.
enum AppAction {
  case counter(CounterAction)
  case primeModal(PrimeModalAction)
  case favoritePrimes(FavoritePrimesAction)

  var counter: CounterAction? {
    get {
      guard case let .counter(value) = self else { return nil }
      return value
    }
    set {
      guard case .counter = self, let newValue = newValue else { return }
      self = .counter(newValue)
    }
  }

  var primeModal: PrimeModalAction? {
    get {
      guard case let .primeModal(value) = self else { return nil }
      return value
    }
    set {
      guard case .primeModal = self, let newValue = newValue else { return }
      self = .primeModal(newValue)
    }
  }

  var favoritePrimes: FavoritePrimesAction? {
    get {
      guard case let .favoritePrimes(value) = self else { return nil }
      return value
    }
    set {
      guard case .favoritePrimes = self, let newValue = newValue else { return }
      self = .favoritePrimes(newValue)
    }
  }
}
