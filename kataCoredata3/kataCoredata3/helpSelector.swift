//
//  helpSelector.swift
//  kataCoredata3
//
//  Created by Wouter on 12/06/2022.
//

import Foundation

extension Int {
    func times(_ f: () -> ()) {
        if self > 0 {
            for _ in 0..<self {
                f()
            }
        }
    }
    
    func times(_ f: @autoclosure () -> ()) {
        if self > 0 {
            for _ in 0..<self {
                f()
            }
        }
    }
}
