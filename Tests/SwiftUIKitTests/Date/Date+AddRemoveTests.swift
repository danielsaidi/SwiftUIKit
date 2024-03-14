//
//  Date+AddRemoveTests.swift
//  SwiftUIKitTests
//
//  Created by Daniel Saidi on 2016-01-18.
//  Copyright © 2016-2024 Daniel Saidi. All rights reserved.
//

import Foundation
import SwiftUIKit
import XCTest

final class DateAddRemoveTests: XCTestCase {
    
    func testCanAddDays() {
        let date = Date(timeIntervalSince1970: 0)
        let result = date.adding(days: 3).timeIntervalSince1970
        XCTAssertEqual(result, 3 * 60 * 60 * 24)
    }
    
    func testCanAddHours() {
        let date = Date(timeIntervalSince1970: 0)
        let result = date.adding(hours: 3).timeIntervalSince1970
        XCTAssertEqual(result, 3 * 60 * 60)
    }
    
    func testCanAddMinutes() {
        let date = Date(timeIntervalSince1970: 0)
        let result = date.adding(minutes: 3).timeIntervalSince1970
        XCTAssertEqual(result, 3 * 60)
    }
    
    func testCanAddSeconds() {
        let date = Date(timeIntervalSince1970: 0)
        let result = date.adding(seconds: 3).timeIntervalSince1970
        XCTAssertEqual(result, 3)
    }
    
    func testCanRemoveDays() {
        let date = Date(timeIntervalSince1970: 3 * 60 * 60 * 24)
        let result = date.removing(days: 3).timeIntervalSince1970
        XCTAssertEqual(result, 0)
    }
    
    func testCanRemoveHours() {
        let date = Date(timeIntervalSince1970: 3 * 60 * 60)
        let result = date.removing(hours: 3).timeIntervalSince1970
        XCTAssertEqual(result, 0)
    }
    
    func testCanRemoveMinutes() {
        let date = Date(timeIntervalSince1970: 3 * 60)
        let result = date.removing(minutes: 3).timeIntervalSince1970
        XCTAssertEqual(result, 0)
    }
    
    func testCanRemoveSeconds() {
        let date = Date(timeIntervalSince1970: 3)
        let result = date.removing(seconds: 3).timeIntervalSince1970
        XCTAssertEqual(result, 0)
    }
    
    func testCanChainAddAndRemoval() {
        let date = Date(timeIntervalSince1970: 0)
        let result = date
            .adding(days: 3)
            .adding(hours: 2)
            .removing(seconds: 15)
            .timeIntervalSince1970
        let days: Double = 3 * 60 * 60 * 24
        let hours: Double = 2 * 60 * 60
        XCTAssertEqual(result, days + hours - 15)
    }
}
