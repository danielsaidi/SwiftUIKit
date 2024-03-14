//
//  Date+InitTests.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-08-05.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import Foundation
import SwiftUIKit
import XCTest

final class Date_InitTests: XCTestCase {
    
    var formatter: DateFormatter!
    
    override func setUp() {
        formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    }
    
    func testCanBeInitializedWithDateComponents() {
        let date = Date(year: 2011, month: 12, day: 10)!
        let string = formatter.string(from: date)
        XCTAssertEqual(string, "2011-12-10 00:00:00")
    }
    
    func testCanBeInitializedWithTimeComponents() {
        let date = Date(year: 2010, month: 03, day: 22, hour: 14, minute: 21, second: 32)!
        let string = formatter.string(from: date)
        XCTAssertEqual(string, "2010-03-22 14:21:32")
    }
}
