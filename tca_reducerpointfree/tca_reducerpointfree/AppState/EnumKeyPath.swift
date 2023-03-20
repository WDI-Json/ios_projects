//
//  EnumKeyPath.swift
//  tca_reducerpointfree
//
//  Created by Wouter on 20/03/2023.
//

import Foundation

public struct EnumKeyPath<Root, Value> {
    let embed: (Value) -> Root
    let extract: (Root) -> Value?
}
// \AppAction.counter // EnumKeyPath<AppAction, CounterAction>
