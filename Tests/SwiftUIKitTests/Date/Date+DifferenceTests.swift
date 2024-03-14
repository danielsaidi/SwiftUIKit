//
//  Date+DifferenceTests.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-08-05.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import Foundation
import SwiftUIKit
import XCTest

final class Date_DifferenceTests: XCTestCase {
    
    func testCanCalculateYearOffset() {
        let date = Date(year: 2017, month: 02, day: 23, hour: 01, minute: 01, second: 01)!
        let oneAgo = Date(year: 2016, month: 02, day: 23, hour: 01, minute: 01, second: 01)!
        let twoAgo = Date(year: 2015, month: 02, day: 23, hour: 01, minute: 01, second: 01)!
        let inOne = Date(year: 2018, month: 02, day: 24, hour: 01, minute: 01, second: 01)!
        let inTwo = Date(year: 2019, month: 02, day: 24, hour: 01, minute: 01, second: 01)!
        
        XCTAssertEqual(date.years(from: oneAgo), 1)
        XCTAssertEqual(date.years(from: twoAgo), 2)
        XCTAssertEqual(date.years(from: inOne), -1)
        XCTAssertEqual(date.years(from: inTwo), -2)
    }
    
    func testCanCalculateMonthOffset() {
        let date = Date(year: 2017, month: 02, day: 23, hour: 01, minute: 01, second: 01)!
        let oneAgo = Date(year: 2017, month: 01, day: 23, hour: 01, minute: 01, second: 01)!
        let twoAgo = Date(year: 2016, month: 12, day: 23, hour: 01, minute: 01, second: 01)!
        let inOne = Date(year: 2017, month: 03, day: 24, hour: 01, minute: 01, second: 01)!
        let inTwo = Date(year: 2017, month: 04, day: 24, hour: 01, minute: 01, second: 01)!
        let inTwelve = Date(year: 2018, month: 02, day: 24, hour: 01, minute: 01, second: 01)!
        
        XCTAssertEqual(date.months(from: oneAgo), 1)
        XCTAssertEqual(date.months(from: twoAgo), 2)
        XCTAssertEqual(date.months(from: inOne), -1)
        XCTAssertEqual(date.months(from: inTwo), -2)
        XCTAssertEqual(date.months(from: inTwelve), -12)
    }
    
    func testCanCalculateWeekOffset() {
        let date = Date(year: 2017, month: 02, day: 02, hour: 01, minute: 01, second: 01)!
        let same = Date(year: 2017, month: 02, day: 02, hour: 01, minute: 01, second: 01)!
        let oneAgo = Date(year: 2017, month: 01, day: 26, hour: 01, minute: 01, second: 01)!
        let twoAgo = Date(year: 2017, month: 01, day: 19, hour: 01, minute: 01, second: 01)!
        let inOne = Date(year: 2017, month: 02, day: 09, hour: 01, minute: 01, second: 01)!
        let inTwo = Date(year: 2017, month: 02, day: 16, hour: 01, minute: 01, second: 01)!
        
        XCTAssertEqual(date.weeks(from: same), 0)
        XCTAssertEqual(date.weeks(from: oneAgo), 1)
        XCTAssertEqual(date.weeks(from: twoAgo), 2)
        XCTAssertEqual(date.weeks(from: inOne), -1)
        XCTAssertEqual(date.weeks(from: inTwo), -2)
    }
    
    func testCanCalculateDayOffset() {
        let date = Date(year: 2017, month: 02, day: 02, hour: 01, minute: 01, second: 01)!
        let oneAgo = Date(year: 2017, month: 02, day: 01, hour: 01, minute: 01, second: 01)!
        let twoAgo = Date(year: 2017, month: 01, day: 31, hour: 01, minute: 01, second: 01)!
        let inOne = Date(year: 2017, month: 02, day: 03, hour: 01, minute: 01, second: 01)!
        let inTwo = Date(year: 2017, month: 02, day: 04, hour: 01, minute: 01, second: 01)!
        let inTwentyEight = Date(year: 2017, month: 03, day: 02, hour: 01, minute: 01, second: 01)!
        
        XCTAssertEqual(date.days(from: oneAgo), 1)
        XCTAssertEqual(date.days(from: twoAgo), 2)
        XCTAssertEqual(date.days(from: inOne), -1)
        XCTAssertEqual(date.days(from: inTwo), -2)
        XCTAssertEqual(date.days(from: inTwentyEight), -28)
    }
    
    func testCanCalculateHourOffset() {
        let date = Date(year: 2017, month: 02, day: 02, hour: 01, minute: 01, second: 01)!
        let oneAgo = Date(year: 2017, month: 02, day: 02, hour: 00, minute: 01, second: 01)!
        let twoAgo = Date(year: 2017, month: 02, day: 01, hour: 23, minute: 01, second: 01)!
        let inOne = Date(year: 2017, month: 02, day: 02, hour: 02, minute: 01, second: 01)!
        let inTwo = Date(year: 2017, month: 02, day: 02, hour: 03, minute: 01, second: 01)!
        let inTwentyFour = Date(year: 2017, month: 02, day: 03, hour: 01, minute: 01, second: 01)!
        
        XCTAssertEqual(date.hours(from: oneAgo), 1)
        XCTAssertEqual(date.hours(from: twoAgo), 2)
        XCTAssertEqual(date.hours(from: inOne), -1)
        XCTAssertEqual(date.hours(from: inTwo), -2)
        XCTAssertEqual(date.hours(from: inTwentyFour), -24)
    }
    
    func testCanCalculateMinuteOffset() {
        let date = Date(year: 2017, month: 02, day: 02, hour: 01, minute: 01, second: 01)!
        let oneAgo = Date(year: 2017, month: 02, day: 02, hour: 01, minute: 00, second: 01)!
        let twoAgo = Date(year: 2017, month: 02, day: 02, hour: 00, minute: 59, second: 01)!
        let inOne = Date(year: 2017, month: 02, day: 02, hour: 01, minute: 02, second: 01)!
        let inTwo = Date(year: 2017, month: 02, day: 02, hour: 01, minute: 03, second: 01)!
        let inSixty = Date(year: 2017, month: 02, day: 02, hour: 02, minute: 01, second: 01)!
        
        XCTAssertEqual(date.minutes(from: oneAgo), 1)
        XCTAssertEqual(date.minutes(from: twoAgo), 2)
        XCTAssertEqual(date.minutes(from: inOne), -1)
        XCTAssertEqual(date.minutes(from: inTwo), -2)
        XCTAssertEqual(date.minutes(from: inSixty), -60)
    }
    
    func testCanCalculateSecondOffset() {
        let date = Date(year: 2017, month: 02, day: 02, hour: 01, minute: 01, second: 01)!
        let oneAgo = Date(year: 2017, month: 02, day: 02, hour: 01, minute: 01, second: 00)!
        let twoAgo = Date(year: 2017, month: 02, day: 02, hour: 01, minute: 00, second: 59)!
        let inOne = Date(year: 2017, month: 02, day: 02, hour: 01, minute: 01, second: 02)!
        let inTwo = Date(year: 2017, month: 02, day: 02, hour: 01, minute: 01, second: 03)!
        let inSixty = Date(year: 2017, month: 02, day: 02, hour: 01, minute: 02, second: 01)!
        
        XCTAssertEqual(date.seconds(from: oneAgo), 1)
        XCTAssertEqual(date.seconds(from: twoAgo), 2)
        XCTAssertEqual(date.seconds(from: inOne), -1)
        XCTAssertEqual(date.seconds(from: inTwo), -2)
        XCTAssertEqual(date.seconds(from: inSixty), -60)
    }
}
