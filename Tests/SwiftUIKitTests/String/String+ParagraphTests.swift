//
//  String+ParagraphTests.swift
//  SwiftUIKitTests
//
//  Created by Daniel Saidi on 2021-11-29.
//  Copyright © 2021-2024 Daniel Saidi. All rights reserved.
//

import SwiftUIKit
import XCTest

final class String_ParagraphTests: XCTestCase {
    
    let none = "foo bar baz"
    let single = "foo\nbar baz"
    let multi = "foo\nbar\rbaz"
    
    func currentResult(for string: String, from location: UInt) -> UInt {
        string.findIndexOfCurrentParagraph(from: location)
    }
    
    func testIndexOfCurrentParagraph() {
        XCTAssertEqual(currentResult(for: "", from: 0), 0)
        XCTAssertEqual(currentResult(for: "", from: 20), 0)
        
        XCTAssertEqual(currentResult(for: none, from: 0), 0)
        XCTAssertEqual(currentResult(for: none, from: 10), 0)
        XCTAssertEqual(currentResult(for: none, from: 20), 0)
        
        XCTAssertEqual(currentResult(for: single, from: 0), 0)
        XCTAssertEqual(currentResult(for: single, from: 5), 4)
        XCTAssertEqual(currentResult(for: single, from: 10), 4)
        
        XCTAssertEqual(currentResult(for: multi, from: 0), 0)
        XCTAssertEqual(currentResult(for: multi, from: 5), 4)
        XCTAssertEqual(currentResult(for: multi, from: 10), 8)
    }
    
    func nextResult(for string: String, from location: UInt) -> UInt {
        string.findIndexOfNextParagraph(from: location)
    }
    
    func testIndexOfNextParagraph() {
        XCTAssertEqual(nextResult(for: "", from: 0), 0)
        XCTAssertEqual(nextResult(for: "", from: 20), 0)
        
        XCTAssertEqual(nextResult(for: none, from: 0), 0)
        XCTAssertEqual(nextResult(for: none, from: 10), 0)
        XCTAssertEqual(nextResult(for: none, from: 20), 0)
        
        XCTAssertEqual(nextResult(for: single, from: 0), 4)
        XCTAssertEqual(nextResult(for: single, from: 5), 4)
        XCTAssertEqual(nextResult(for: single, from: 10), 4)
        
        XCTAssertEqual(nextResult(for: multi, from: 0), 4)
        XCTAssertEqual(nextResult(for: multi, from: 5), 8)
        XCTAssertEqual(nextResult(for: multi, from: 10), 8)
    }
}
