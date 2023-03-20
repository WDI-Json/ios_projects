//
//  Store.swift
//  tca_reducerpointfree
//
//  Created by Wouter on 09/03/2023.
//

import Foundation

final class Store<Value, Action>: ObservableObject {
    let reducer: (inout Value, Action) -> Void

    @Published var value: Value

    init(
        initialValue: Value,
        reducer: @escaping (inout Value, Action) -> Void
    ) {
        self.reducer = reducer
        value = initialValue
    }

    func send(_ action: Action) {
        reducer(&value, action)
    }
}
