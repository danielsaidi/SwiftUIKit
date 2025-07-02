//
//  Date+Compare.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2015-05-15.
//  Copyright © 2015-2025 Daniel Saidi. All rights reserved.
//

import Foundation

/// This extension provides more readable date comparisons.
public extension Date {
    
    /// Whether the date occurs after another date.
    func isAfter(_ date: Date) -> Bool {
        self > date
    }
    
    /// Whether the date occurs before another date.
    func isBefore(_ date: Date) -> Bool {
        self < date
    }
    
    /// Whether the date is the same as another date.
    func isSame(as date: Date) -> Bool {
        self == date
    }

    /// Whether the date is the same as another date, for an
    /// explicity granularity, like `.day`.
    func isSame(
        _ granularity: Calendar.Component,
        as date: Date,
        for calendar: Calendar = .current
    ) -> Bool {
        calendar.isDate(self, equalTo: date, toGranularity: granularity)
    }

    /// Whether the date is the same as another date, for an
    /// explicity granularity, like `.day`.
    func isThis(
        _ granularity: Calendar.Component,
        for calendar: Calendar = .current
    ) -> Bool {
        isSame(granularity, as: Date(), for: calendar)
    }
}
