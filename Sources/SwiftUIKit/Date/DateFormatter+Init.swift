//
//  DateFormatter+Init.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2018-09-05.
//  Copyright © 2018-2024 Daniel Saidi. All rights reserved.
//

import Foundation

public extension DateFormatter {

    /**
     Create a custom date formatter, with a date style, time
     style, locale, and calendar.

     - Parameters:
       - dateStyle: The date style to use.
       - timeStyle: The time style to use, by default `.none`.
       - locale: The locale to use, by default `en_US_POSIX`.
       - calendar: The calendar to use, by default `.iso8601`.
     */
    convenience init(
        dateStyle: DateFormatter.Style,
        timeStyle: DateFormatter.Style = .none,
        locale: Locale = .init(identifier: "en_US_POSIX"),
        calendar: Calendar = .init(identifier: .iso8601)
    ) {
        self.init()
        self.dateStyle = dateStyle
        self.timeStyle = timeStyle
        self.locale = locale
        self.calendar = calendar
    }
    
    /**
     Create a custom date formatter, with a date format, for
     a certain calender, locale and time zone.

     - Parameters:
       - dateFormat: The date string format to use.
       - calendar: The calendar to use, by default `iso8601`.
       - locale: The locale to use, by default `en_US_POSIX`.
       - timeZone: The time zone to use, by default `GMT`.
     */
    convenience init(
        dateFormat: String,
        calendar: Calendar = .init(identifier: .iso8601),
        locale: Locale = .init(identifier: "en_US_POSIX"),
        timeZone: TimeZone? = .init(secondsFromGMT: 0)
    ) {
        self.init()
        self.calendar = calendar
        self.locale = locale
        self.dateFormat = dateFormat
        self.timeZone = timeZone
    }
    
    /// Create an ISO8601 second date formatter.
    static var iso8601Seconds: DateFormatter {
        .init(dateFormat: "yyyy-MM-dd'T'HH:mm:ssZ")
    }
    
    /// Create an ISO8601 ms date formatter.
    static var iso8601Milliseconds: DateFormatter {
        .init(dateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSSZ")
    }
}
