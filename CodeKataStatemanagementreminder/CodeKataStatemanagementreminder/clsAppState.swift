//
//  clsAppState.swift
//  CodeKataStatemanagementreminder
//
//  Created by Wouter on 04/05/2022.
//

import Foundation
import Combine

class AppState: ObservableObject {
    @Published var count: Int = 0 
}
