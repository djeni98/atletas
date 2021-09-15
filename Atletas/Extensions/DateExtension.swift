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
    
    func startOfMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
    }
    
    func endOfMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
    }
    
    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}

extension Date {
    static func randomBetween(start: String, end: String, format: String = "yyyy-MM-dd") -> String {
        let date1 = Date.parse(start, format: format)
        let date2 = Date.parse(end, format: format)
        return Date.randomBetween(start: date1, end: date2).dateString(format)
    }

    static func randomBetween(start: Date, end: Date) -> Date {
        var date1 = start
        var date2 = end
        if date2 < date1 {
            let temp = date1
            date1 = date2
            date2 = temp
        }
        let span = TimeInterval.random(in: date1.timeIntervalSinceNow...date2.timeIntervalSinceNow)
        return Date(timeIntervalSinceNow: span)
    }

    func dateString(_ format: String = "yyyy-MM-dd") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

    static func parse(_ string: String, format: String = "yyyy-MM-dd") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.default
        dateFormatter.dateFormat = format

        let date = dateFormatter.date(from: string)!
        return date
    }
}

extension Date {
    var readableDate: String {
        var dateString = ""
        
        dateString += self.localizedMonth
        
        
        let year = get(.year)
        let currentDate = Date()
        if year != currentDate.get(.year) {
            dateString += " de \(year)"
        }
        
        return dateString
    }
}

extension Date {
    var localizedMonth: String {
        var calendar = Calendar.current
        calendar.locale = Locale(identifier: "pt")
        let names = calendar.monthSymbols
        let month = Calendar.current.component(.month, from: self)
        return names[month - 1]
    }
}
