//
//  String+ReplaceTests.swift
//  SwiftUIKitTests
//
//  Created by Daniel Saidi on 2016-12-13.
//  Copyright © 2020-2023 Daniel Saidi. All rights reserved.
//

import SwiftUIKit
import XCTest

final class String_ReplaceTests: XCTestCase {
    
    let string = "Hello, world!"
    
    func testReplacingDoesNothingIfNoMatchIsFound() {
        XCTAssertEqual(string.replacing("World", with: "you"), string)
        XCTAssertEqual(string.replacing("World", with: "you", caseSensitive: true), string)
        XCTAssertEqual(string.replacing("Earth", with: "you", caseSensitive: false), string)
    }
    
    func testCanPerformCaseSensitiveReplace() {
        XCTAssertEqual(string.replacing("world", with: "you"), "Hello, you!")
        XCTAssertEqual(string.replacing("world", with: "you", caseSensitive: true), "Hello, you!")
    }
    
    func testCanPerformCaseInsensitiveReplace() {
        XCTAssertEqual(string.replacing("World", with: "you", caseSensitive: false), "Hello, you!")
        XCTAssertEqual(string.replacing("world", with: "you", caseSensitive: false), "Hello, you!")
    }
}
