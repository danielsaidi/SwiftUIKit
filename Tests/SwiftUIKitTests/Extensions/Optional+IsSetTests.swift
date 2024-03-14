//
//  Optional+IsSetTests.swift
//  SwiftUIKitTests
//
//  Created by Daniel Saidi on 2020-06-09.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import Foundation
import SwiftUIKit
import XCTest

final class Optional_HasValue: XCTestCase {
    
    var value: String?
    
    override func setUp() {
        value = nil
    }
    
    func testNilValue() {
        XCTAssertTrue(value.isNil)
        XCTAssertFalse(value.isSet)
    }
    
    func testNonNilValue() {
        value = "value"
        XCTAssertTrue(value.isSet)
        XCTAssertFalse(value.isNil)
    }
}
