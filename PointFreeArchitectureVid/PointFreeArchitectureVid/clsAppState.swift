//
//  clsAppState.swift
//  PointFreeArchitectureVid
//
//  Created by Wouter on 30/04/2022.
//

import Combine

class AppState: ObservableObject{
    @Published var count: Int = 0
    @Published var favoritePrimes: [Int] = []
    //@Published var $alertNthPrime
}
