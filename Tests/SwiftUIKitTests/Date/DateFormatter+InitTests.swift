//
//  DateFormatter+InitTests.swift
//  SwiftUIKitTests
//
//  Created by Daniel Saidi on 2018-09-05.
//  Copyright © 2018-2024 Daniel Saidi. All rights reserved.
//

import Foundation
import SwiftUIKit
import XCTest

final class DateFormatter_InitTests: XCTestCase {

    func testConvenienceInitializerUsesUsEnglishWithNoTimeByDefault() {
        let formatter = DateFormatter(dateStyle: .medium)
        XCTAssertEqual(formatter.locale.identifier, "en_US_POSIX")
        XCTAssertEqual(formatter.dateStyle, .medium)
        XCTAssertEqual(formatter.timeStyle, .none)
    }

    func testConvenienceInstanceGeneratesValidDateStringForMediumDateStyle() {
        let date = Date(year: 2022, month: 10, day: 19) ?? Date()
        let formatter = DateFormatter(dateStyle: .medium)
        let result = formatter.string(from: date)
        XCTAssertEqual(result, "Oct 19, 2022")
    }

    func testConvenienceInstanceGeneratesValidDateStringForLongDateAndShortTime() {
        let date = Date(year: 2022, month: 10, day: 19) ?? Date()
        let formatter = DateFormatter(
            dateStyle: .long,
            timeStyle: .short
        )
        let result = formatter.string(from: date)
        let expected = "October 19, 2022 at 12:00 AM"
        XCTAssertEqual(result, expected)
    }

    func testConvenienceInstanceGeneratesValidDateStringForCustomLocale() {
        let date = Date(year: 2022, month: 10, day: 19) ?? Date()
        let formatter = DateFormatter(
            dateStyle: .long,
            timeStyle: .short,
            locale: Locale(identifier: "sv-SE")
        )
        let result = formatter.string(from: date)
        XCTAssertEqual(result, "19 oktober 2022 00:00")
    }

    func testIso8601SecondFormatterIsValid() {
        let formatter = DateFormatter.iso8601Seconds
        XCTAssertEqual(formatter.dateFormat, "yyyy-MM-dd'T'HH:mm:ssZ")
        XCTAssertEqual(formatter.calendar.identifier, .iso8601)
        XCTAssertEqual(formatter.locale.identifier, "en_US_POSIX")
        XCTAssertNotNil(formatter.timeZone)
    }

    func testIso8601MilliSecondFormatterIsValid() {
        let formatter = DateFormatter.iso8601Milliseconds
        XCTAssertEqual(formatter.dateFormat, "yyyy-MM-dd'T'HH:mm:ss.SSSZ")
        XCTAssertEqual(formatter.calendar.identifier, .iso8601)
        XCTAssertEqual(formatter.locale.identifier, "en_US_POSIX")
        XCTAssertNotNil(formatter.timeZone)
    }
}
