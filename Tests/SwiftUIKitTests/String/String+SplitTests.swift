//
//  String+SplitTests.swift
//  SwiftUIKitTests
//
//  Created by Daniel Saidi on 2021-09-08.
//  Copyright © 2021-2024 Daniel Saidi. All rights reserved.
//

import SwiftUIKit
import XCTest

final class String_SplitTests: XCTestCase {
    
    func testSplittingOnMultipleSeparators() {
        let string = "I.Love,Swift!Very much"
        let result = string.split(by: [".", ",", "!"])
        let expected = ["I", "Love", "Swift", "Very much"]
        XCTAssertEqual(result, expected)
    }
}
