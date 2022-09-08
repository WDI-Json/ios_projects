//
//  ContentViewModel.swift
//  ListViewSection
//
//  Created by Wouter on 30/08/2022.
//

import Foundation

struct WeekWithDates: Identifiable {
    var id: Int { weekNumber }
    var weekNumber: Int
    let dates: [Date]
}


class ContentViewModel: ObservableObject {
    
    //    @Published var dateDict: [Int: [Date]]
    @Published var dateStructs: [WeekWithDates] = []
    
    init() {
        let dateDict = Dictionary(grouping: Date.dateRange(from: Date(), to: Date().endOfMonth(addMonth: 1)), by: { $0.weekNumber() })
        //        self.dateStructs = dateDict.map { (weekNumber, dates) in WeekWithDates(weekNumber: weekNumber, dates: dates) }
        self.dateStructs = dateDict.map { WeekWithDates(weekNumber: $0, dates: $1) }.sorted(by: { $0.weekNumber < $1.weekNumber } )
    }
}

