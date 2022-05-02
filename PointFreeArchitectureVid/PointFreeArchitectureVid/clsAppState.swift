//
//  clsAppState.swift
//  PointFreeArchitectureVid
//
//  Created by Wouter on 30/04/2022.
//

import Combine
import Foundation
import SwiftUI

class AppState: ObservableObject{
    @Published var count: Int = 0
    @Published var favoritePrimes: [Int] = []
    @Published var loggedInUser: User?
    @Published var activityFeed: [Activity] = []
    
    struct Activity {
        let timestamp: Date
        let type: ActivityType
        
        enum ActivityType {
            case addedFavoritePrime(Int)
            case removedFavoritePrime(Int)
          }
    }
    
    struct User {
        let id: Int
        let name: String
        let bio: String
    }
}
