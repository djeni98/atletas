//
//  DateExtension.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 05/09/21.
//

import Foundation

// Reference
// https://www.hackingwithswift.com/forums/100-days-of-swiftui/getting-the-difference-between-two-dates-in-swiftui/3070

extension Date {
    func getOffsetFrom(date: Date) -> DateComponents {
        let date1 = self
        let date2 = date

        let diffs = Calendar.current.dateComponents([.year, .month, .day], from: date1, to: date2)

        return diffs
    }

    static func fromDayMonthYear(_ string: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"

        return formatter.date(from: string)
    }

    func toDayMonthYearString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"

        return formatter.string(from: self)
    }
}
