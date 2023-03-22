//
//  CounterReducer.swift
//  tca_reducerpointfree
//
//  Created by Wouter on 10/03/2023.
//

import Foundation

public func counterReducer(state: inout Int, action: CounterAction) {
    switch action {
    case .decrTapped:
        state -= 1
    case .incrTapped:
        state += 1
    }
}
