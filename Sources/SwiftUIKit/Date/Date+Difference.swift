//
//  Date+Difference.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-08-05.
//  Copyright © 2020-2025 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Date {
    
    /// The number of years between this and another date.
    func years(from date: Date, calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.year], from: date, to: self).year ?? 0
    }
    
    /// The number of months between this and another date.
    func months(from date: Date, calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.month], from: date, to: self).month ?? 0
    }
    
    /// The number of weeks between this and another date.
    func weeks(from date: Date, calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.weekOfYear], from: date, to: self).weekOfYear ?? 0
    }
    
    /// The number of days between this and another date.
    func days(from date: Date, calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.day], from: date, to: self).day ?? 0
    }
    
    /// The number of hours between this and another date.
    func hours(from date: Date, calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    
    /// The number of minutes between this and another date.
    func minutes(from date: Date, calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    
    /// The number of seconds between this and another date.
    func seconds(from date: Date, calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.second], from: date, to: self).second ?? 0
    }
}
