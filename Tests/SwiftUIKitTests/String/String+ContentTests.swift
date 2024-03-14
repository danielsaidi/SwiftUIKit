//
//  String+ContentTests.swift
//  SwiftUIKitTests
//
//  Created by Daniel Saidi on 2020-06-04.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import SwiftUIKit
import XCTest

final class String_ContentTests: XCTestCase {
    
    func testHasContent() {
        XCTAssertFalse("".hasContent)
        XCTAssertTrue(" ".hasContent)
    }
    
    func testHasTrimmedContent() {
        XCTAssertFalse("".hasTrimmedContent)
        XCTAssertFalse(" ".hasTrimmedContent)
        XCTAssertTrue(" . ".hasTrimmedContent)
    }
}
