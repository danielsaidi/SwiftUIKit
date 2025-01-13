//
//  Date+Components.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-11-03.
//  Copyright © 2021-2025 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Date {
    
    /// Get the current day for the current calendar.
    var day: Int? { day() }
    
    /// Get the current hour for the current calendar.
    var hour: Int? { hour() }
    
    /// Get the current minute for the current calendar.
    var minute: Int? { minute() }
    
    /// Get the current month for the current calendar.
    var month: Int? { month() }
    
    /// Get the current second for the current calendar.
    var second: Int? { second() }
    
    /// Get the current year for the current calendar.
    var year: Int? { year() }
    
    
    /// Get the current day for the provided calendar.
    func day(
        for calendar: Calendar = .current
    ) -> Int? {
        calendar.dateComponents([.day], from: self).day
    }
    
    /// Get the current hour for the provided calendar.
    func hour(
        for calendar: Calendar = .current
    ) -> Int? {
        calendar.dateComponents([.hour], from: self).hour
    }
    
    /// Get the current minute for the provided calendar.
    func minute(
        for calendar: Calendar = .current
    ) -> Int? {
        calendar.dateComponents([.minute], from: self).minute
    }
    
    /// Get the current month for the provided calendar.
    func month(
        for calendar: Calendar = .current
    ) -> Int? {
        calendar.dateComponents([.month], from: self).month
    }
    
    /// Get the current second for the provided calendar.
    func second(
        for calendar: Calendar = .current
    ) -> Int? {
        calendar.dateComponents([.second], from: self).second
    }
    
    /// Get the current year for the provided calendar.
    func year(
        for calendar: Calendar = .current
    ) -> Int? {
        calendar.dateComponents([.year], from: self).year
    }
}
