//
//  ComposableArchitecture.swift
//  ComposableArchitecture
//
//  Created by Wouter on 22/03/2023.
//

import SwiftUI
import Combine

public final class Store<Value, Action>: ObservableObject {
    private let reducer: (inout Value, Action) -> Void
    @Published public private(set) var value: Value
    private var cancellable: Cancellable?

    public init(
        initialValue: Value,
        reducer: @escaping (inout Value, Action) -> Void
    ) {
//        self.objectWillChange
        self.reducer = reducer
        value = initialValue
    }

    public func send(_ action: Action) {
        reducer(&value, action)
    }

    // ((Value) -> LocalValue) -> (Store<Value, _>) -> Store<LocalValue, _>
    // ((A) ->B) -> (Store<A, _>) -> Store<B, _>
    // map: ((A) -> B) -> (F<A> -> F<B>)
    public func view<LocalValue>(
        _ f: @escaping (Value) -> LocalValue
    ) -> Store<LocalValue, Action> {
        let localStore =  Store<LocalValue, Action>(
            initialValue: f(self.value),
            reducer: { localValue, action in
                self.send(action)
                localValue = f(self.value)
            }
        )
        localStore.cancellable = self.$value.sink { [weak localStore] newValue in
            localStore?.value = f(newValue)
        }
        return localStore
    }

    func transform<A, B, Action>(
        _ reducer: (A, Action) -> Void,
        _ f: (A) -> B
    ) -> (B, Action) -> Void {
        fatalError()
    }
}

/// combine is a higher-order reducer: it’s a function that takes a number of reducers as input (so long as they work with the same value and action types), and it returns a brand new reducer as output by running each of the given reducers.
/// - Parameter reducers: <#reducers description#>
/// - Returns: <#description#>
public func combine<Value, Action>(
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
public func pullback<LocalValue, GlobalValue, LocalAction, GlobalAction>(
    _ reducer: @escaping (inout LocalValue, LocalAction) -> Void,
    value: WritableKeyPath<GlobalValue, LocalValue>,
    action: WritableKeyPath<GlobalAction, LocalAction?>
) -> (inout GlobalValue, GlobalAction) -> Void {

    return { globalValue, globalAction in
        guard let localAction = globalAction[keyPath: action ] else { return }
        reducer(&globalValue[keyPath: value], localAction)
    }
}

public func logging<Value, Action>(
_ reducer: @escaping (inout Value, Action) -> Void
) -> (inout Value, Action) -> Void {
    return { value, action in
        reducer(&value, action)
        print("Action: \(action)")
        print("Value:")
        dump(value)
        print("---")
    }
}
