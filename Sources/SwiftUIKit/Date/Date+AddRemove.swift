//
//  Date+Adding.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2015-05-15.
//  Copyright © 2015-2025 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Date {
    
    /// Add a certain number days days to the date.
    func adding(days: Double) -> Date {
        let seconds = Double(days) * 60 * 60 * 24
        return addingTimeInterval(seconds)
    }
    
    /// Add a certain number hours days to the date.
    func adding(hours: Double) -> Date {
        let seconds = Double(hours) * 60 * 60
        return addingTimeInterval(seconds)
    }
    
    /// Add a certain number minutes days to the date.
    func adding(minutes: Double) -> Date {
        let seconds = Double(minutes) * 60
        return addingTimeInterval(seconds)
    }
    
    /// Add a certain number seconds days to the date.
    func adding(seconds: Double) -> Date {
        addingTimeInterval(Double(seconds))
    }
    
    /// Remove a certain number of days to the date.
    func removing(days: Double) -> Date {
        adding(days: -days)
    }
    
    /// Remove a certain number of hours to the date.
    func removing(hours: Double) -> Date {
        adding(hours: -hours)
    }
    
    /// Remove a certain number of minutes to the date.
    func removing(minutes: Double) -> Date {
        adding(minutes: -minutes)
    }
    
    /// Remove a certain number of seconds to the date.
    func removing(seconds: Double) -> Date {
        adding(seconds: -seconds)
    }
}
