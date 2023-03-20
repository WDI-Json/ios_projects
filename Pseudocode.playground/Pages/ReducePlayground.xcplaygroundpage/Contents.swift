//: [Previous](@previous)

import Foundation
import SwiftUI

struct PlanningStruct: Hashable {
    let uuid: String
    let date: Date
    var dayPart: String
}
let firstGeneratedDate = Date()
let endGeneratedDate = Date().adding(.month, value: 1).startOfWeek
let now = Date().startOfDay
let dateRange = Date.dateRange(from: firstGeneratedDate, to: endGeneratedDate)
    .filter({ !$0.isWeekend && !$0.isInThePast || $0.isSameDateAs(now) })
    .sorted(by: { $0 < $1 })

let planningMorning: [PlanningStruct] = dateRange.map {date in
    return PlanningStruct(uuid: UUID().description, date: date, dayPart: "morning")
}
let planningMidday: [PlanningStruct] = dateRange.map {date in
    return PlanningStruct(uuid: UUID().description, date: date, dayPart: "midday")
}
let testData = planningMorning + planningMidday

let weeknumbers = testData.reduce([Int]()) { res, planning in
    var weeknumberArray = res
    if !weeknumberArray.contains(planning.date.weekNumber) {
        weeknumberArray.append(planning.date.weekNumber)
    }
    return weeknumberArray
}

for number in weeknumbers {
    print("weeknumber \(number) has these plannings:")
    for planning in testData {
        if planning.date.weekNumber == number {
            print("Reservation on \(planning.date) daypart: \(planning.dayPart)")
        }
    }
}

/*****************DATE EXTENSIONS*****************/
extension Date {

    public var weekNumber: Int {
        Calendar.current.component(.weekOfYear, from: self)
    }

    public var year: Int {
        Calendar.current.component(.yearForWeekOfYear, from: self)
    }

    public var month: Int {
        Calendar.current.component(.month, from: self)
    }

    public var day: Int {
        Calendar.current.component(.day, from: self)
    }

    var isInThePast: Bool {
        self < .now
    }

    var isWeekend: Bool {
        Calendar.current.isDateInWeekend(self)
    }

    public var startOfMonth: Date {
        if
            let date = Calendar.current.date(
                from: Calendar.current.dateComponents(
                    [.year, .month],
                    from: Calendar.current.startOfDay(for: self)
                )
            )
        {
            return date
        }
        return self
    }

    public var endOfMonth: Date {
        if
            let date = Calendar.current.date(
                byAdding: DateComponents(month: 1, day: -1),
                to: startOfMonth
            )
        {
            return Calendar.current.startOfDay(for: date)
        }
        return self
    }

    public var startOfDay: Date {
        Calendar.current.date(bySettingHour: 00, minute: 00, second: 00, of: self) ?? self
    }

    var endOfWeek: Date? {
        let calendar = Calendar.current
        guard
            let sunday = calendar.date(
                from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)
            ) else
        {
            return nil
        }

        return calendar.date(byAdding: .day, value: 7, to: sunday)
    }

    var startOfWeek: Date {
        let calendar = Calendar.current
        return calendar.dateComponents([.calendar, .yearForWeekOfYear, .weekOfYear], from: self).date ?? self
    }

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

    public func isSameDateAs(_ compareTo: Date) -> Bool {
        Calendar.current.isDate(self, inSameDayAs: compareTo)
    }

    public func isInSameYear(as date: Date) -> Bool {
        Calendar.current.isDate(self, equalTo: date, toGranularity: .year)
    }

    func adding(_ component: Calendar.Component, value: Int, using calendar: Calendar = .current) -> Date {
        calendar.date(byAdding: component, value: value, to: self) ?? self
    }

    public func formatToString(using formatter: DateFormatter) -> String {
        formatter.string(from: self)
    }
}

