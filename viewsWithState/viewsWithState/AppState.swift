//
//  AppState.swift
//  viewsWithState
//
//  Created by Wouter on 28/04/2022.
//

import Foundation
import Combine

class AppState: ObservableObject{
    @Published var currentNumber = 0 {
        didSet{
            self.didChange.send(())
        }
    }
    var didChange = PassthroughSubject<Void, Never>()
    
    func getState() -> Int {
        return currentNumber
    }
}
