//
//  Date+Extensions.swift
//  GeometryReaderCards
//
//  Created by Wouter on 01/09/2022.
//

import Foundation

extension Date {
    
    public static func dateRange(from fromDate: Date, to toDate: Date) -> [Date] {
        var dates: [Date] = []
        var date = fromDate
        
        while date <= toDate {
            date = Calendar.current.startOfDay(for: date)
            dates.append(date)
            guard let newDate = Calendar.current.date(byAdding: .day, value: 1, to: date) else { break }
            date = newDate
        }
        return dates
    }
    
    public func startOfMonth() -> Date {
        if let date = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self))) {
            return date
        }
        return self
    }
    
    public func endOfMonth(addMonth: Int? = 1) -> Date {
        if let date =  Calendar.current.date(byAdding: DateComponents(month: addMonth, day: -1), to: self.startOfMonth()) {
            return Calendar.current.startOfDay(for: date)
        }
        return self
    }
    
    public func weekNumber() -> Int {
        return Calendar.current.component(.weekOfYear, from: self)
    }
    
    public func formatToString(using formatter: DateFormatter) -> String {
        return formatter.string(from: self)
    }
}
