//
//  Date+CompareTests.swift
//  SwiftUIKitTests
//
//  Created by Daniel Saidi on 2020-05-28.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import Foundation
import SwiftUIKit
import XCTest

final class DateComparingTests: XCTestCase {
    
    func testComparisonCanCheckIfDateIsBeforeAnother() {
        let date1 = Date(timeIntervalSince1970: 0)
        let date2 = Date(timeIntervalSince1970: 1)
        XCTAssertTrue(date1.isBefore(date2))
        XCTAssertFalse(date2.isBefore(date1))
    }
    
    func testComparisonCanCheckIfDateIsAfterAnother() {
        let date1 = Date(timeIntervalSince1970: 0)
        let date2 = Date(timeIntervalSince1970: 1)
        XCTAssertFalse(date1.isAfter(date2))
        XCTAssertTrue(date2.isAfter(date1))
    }
    
    func testComparisonCanCheckIfDateIsSameAsAnother() {
        let date1 = Date(timeIntervalSince1970: 0)
        let date2 = Date(timeIntervalSince1970: 1)
        let date3 = Date(timeIntervalSince1970: 0)
        XCTAssertFalse(date1.isSame(as: date2))
        XCTAssertTrue(date1.isSame(as: date3))
    }
}
