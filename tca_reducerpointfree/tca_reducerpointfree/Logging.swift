//
//  Logging.swift
//  tca_reducerpointfree
//
//  Created by Wouter on 21/03/2023.
//

import Foundation

func logging<Value, Action>(
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
