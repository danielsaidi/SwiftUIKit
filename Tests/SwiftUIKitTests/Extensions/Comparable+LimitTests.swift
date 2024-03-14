//
//  Comparable+LimitTests.swift
//  SwiftUIKitTests
//
//  Created by Daniel Saidi on 2018-10-04.
//  Copyright © 2018-2024 Daniel Saidi. All rights reserved.
//

import SwiftUIKit
import XCTest

final class Comparable_LimitTests: XCTestCase {
    
    func testLimitComparable() {
        var value = 5
        value.limit(to: 0...10)
        XCTAssertEqual(value, 5)
        value.limit(to: 6...10)
        XCTAssertEqual(value, 6)
        value.limit(to: 0...4)
        XCTAssertEqual(value, 4)
    }
    
    func testLimitedComparable() {
        XCTAssertEqual(5.limited(to: 0...10), 5)
        XCTAssertEqual((-1).limited(to: 0...10), 0)
        XCTAssertEqual(11.limited(to: 0...10), 10)
    }
}
