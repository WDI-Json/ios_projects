//
//  ContentViewModel.swift
//  ListViewSection
//
//  Created by Wouter on 30/08/2022.
//

import Foundation

class ContentViewModel: ObservableObject {
    
    @Published var dateDict: [Int: [Date]]
    
    init() {
        dateDict = Dictionary(grouping: Date.dateRange(from: Date(), to: Date().endOfMonth(addMonth: 2)), by: { $0.weekNumber() })
    }
}

