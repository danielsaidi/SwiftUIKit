//
//  Calendar+Date.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-04-29.
//  Copyright © 2021-2024 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Calendar {
    
    /**
     Whether or not this calendar thinks that a certain date
     is the same day as another date.
     */
    func isDate(
        _ date1: Date,
        sameDayAs date2: Date
    ) -> Bool {
        isDate(date1, equalTo: date2, toGranularity: .day)
    }
    
    /**
     Whether or not this calendar thinks that a certain date
     is the same month as another date.
     */
    func isDate(
        _ date1: Date,
        sameMonthAs date2: Date
    ) -> Bool {
        isDate(date1, equalTo: date2, toGranularity: .month)
    }
    
    /**
     Whether or not this calendar thinks that a certain date
     is the same week as another date.
     */
    func isDate(
        _ date1: Date,
        sameWeekAs date2: Date
    ) -> Bool {
        isDate(date1, equalTo: date2, toGranularity: .weekOfYear)
    }
    
    /**
     Whether or not this calendar thinks that a certain date
     is the same year as another date.
     */
    func isDate(
        _ date1: Date,
        sameYearAs date2: Date
    ) -> Bool {
        isDate(date1, equalTo: date2, toGranularity: .year)
    }
    
    /**
     Whether or not this calendar thinks that a certain date
     is this month.
     */
    func isDateThisMonth(_ date: Date) -> Bool {
        isDate(date, sameMonthAs: Date())
    }
    
    /**
     Whether or not this calendar thinks that a certain date
     is this week.
     */
    func isDateThisWeek(_ date: Date) -> Bool {
        isDate(date, sameWeekAs: Date())
    }
    
    /**
     Whether or not this calendar thinks that a certain date
     is this year.
     */
    func isDateThisYear(_ date: Date) -> Bool {
        isDate(date, sameYearAs: Date())
    }
    
    /**
     Whether or not this calendar thinks that a certain date
     is today.
     */
    func isDateToday(_ date: Date) -> Bool {
        isDate(date, sameDayAs: Date())
    }
}
