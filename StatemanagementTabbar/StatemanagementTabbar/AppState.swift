//
//  AppState.swift
//  StatemanagementTabbar
//
//  Created by Wouter on 30/04/2022.
//

import Foundation
import Combine

class AppState: ObservableObject {
    @Published var count = 0 {
        didSet{
            self.didChange.send(())
        }
    }
    
    var didChange = PassthroughSubject<Void, Never>()
}
