//
//  Array_RangeTests.swift
//  SwiftUIKitTests
//
//  Created by Daniel Saidi on 2020-06-12.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import SwiftUIKit
import XCTest

final class Array_RangeTests: XCTestCase {
    
    func testArrayWithIntRangeHandlesSmallStepSize() {
        let result = Array(0...10, stepSize: 1)
        XCTAssertEqual(result, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
    }
    
    func testArrayWithIntRangeHandlesLargeStepSize() {
        let result = Array(0...10, stepSize: 3)
        XCTAssertEqual(result, [0, 3, 6, 9])
    }
}
