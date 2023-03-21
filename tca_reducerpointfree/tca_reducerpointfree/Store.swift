//
//  Store.swift
//  tca_reducerpointfree
//
//  Created by Wouter on 09/03/2023.
//

import Foundation

final class Store<Value, Action>: ObservableObject {
    let reducer: (inout Value, Action) -> Void
    @Published private(set) var value: Value

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

/// combine is a higher-order reducer: it’s a function that takes a number of reducers as input (so long as they work with the same value and action types), and it returns a brand new reducer as output by running each of the given reducers.
/// - Parameter reducers: <#reducers description#>
/// - Returns: <#description#>
func combine<Value, Action>(
    _ reducers: (inout Value, Action) -> Void...
) -> (inout Value, Action) -> Void {
    return { value, action in
        for reducer in reducers {
            reducer(&value, action)
        }
    }
}

/// pullback is a higher-order reducer: it’s a function that takes a reducer as input and, given key paths that operate on local state and actions, returns a brand new reducer as output that operates on more global state and actions.
/// - Parameters:
///   - reducer: <#reducer description#>
///   - value: <#value description#>
///   - action: <#action description#>
/// - Returns: <#description#>
func pullback<LocalValue, GlobalValue, LocalAction, GlobalAction>(
    _ reducer: @escaping (inout LocalValue, LocalAction) -> Void,
    value: WritableKeyPath<GlobalValue, LocalValue>,
    action: WritableKeyPath<GlobalAction, LocalAction?>
) -> (inout GlobalValue, GlobalAction) -> Void {

    return { globalValue, globalAction in
        guard let localAction = globalAction[keyPath: action ] else { return }
        reducer(&globalValue[keyPath: value], localAction)
    }
}
