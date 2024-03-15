//
//  Date+Compare.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2015-05-15.
//  Copyright © 2015-2024 Daniel Saidi. All rights reserved.
//

import Foundation

/// This extension provides more readable date comparisons.
public extension Date {
    
    /// Whether or not the date occurs after another date.
    func isAfter(_ date: Date) -> Bool {
        self > date
    }
    
    /// Whether or not the date occurs before another date.
    func isBefore(_ date: Date) -> Bool {
        self < date
    }
    
    /// Whether or not the date is the same as another date.
    func isSame(as date: Date) -> Bool {
        self == date
    }
}
