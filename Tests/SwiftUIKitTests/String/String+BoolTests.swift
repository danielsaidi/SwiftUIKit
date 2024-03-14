//
//  String+BoolTests.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-11-02.
//  Copyright © 2021-2024 Daniel Saidi. All rights reserved.
//

import SwiftUIKit
import XCTest

final class String_BoolTests: XCTestCase {
    
    func result(for string: String) -> Bool {
        string.boolValue
    }
    
    func testBoolValueIsValidForManyDifferentTrueExpressions() {
        let expected = ["YES", "yes", "1"]
        expected.forEach {
            XCTAssertTrue(result(for: $0))
        }
    }
    
    func testBoolValueIsValidForManyDifferentFalseExpressions() {
        let expected = ["NO", "no", "0"]
        expected.forEach {
            XCTAssertFalse(result(for: $0))
        }
    }
}
