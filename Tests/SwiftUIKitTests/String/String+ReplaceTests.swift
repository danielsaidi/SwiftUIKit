//
//  String+ReplaceTests.swift
//  SwiftUIKitTests
//
//  Created by Daniel Saidi on 2016-12-13.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import SwiftUIKit
import XCTest

final class String_ReplaceTests: XCTestCase {
    
    let string = "Hello, world!"
    
    func testReplacingCanPerformOptionsBasedReplacements() {
        XCTAssertEqual(string.replacing("World", with: "you"), "Hello, world!")
        XCTAssertEqual(string.replacing("world", with: "you"), "Hello, you!")
        XCTAssertEqual(string.replacing("World", with: "you", .caseInsensitive), "Hello, you!")
        XCTAssertEqual(string.replacing("Earth", with: "you"), "Hello, world!")
    }
}
