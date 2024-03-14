//
//  String+ContainsTests.swift
//  SwiftUIKitTests
//
//  Created by Daniel Saidi on 2016-12-13.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import SwiftUIKit
import XCTest

final class String_ContainsTests: XCTestCase {
    
    func testCaseSensitiveCheckFindsExistingString() {
        let result = "foo".contains("foo", caseSensitive: true)
        XCTAssertTrue(result)
    }
    
    func testCaseSensitiveCheckDoesNotFindNonExistingString() {
        let result = "foo".contains("foO", caseSensitive: true)
        XCTAssertFalse(result)
    }
    
    
    func textCaseInsensitiveCheckFindsExistingStringCaseSensitively() {
        let result = "foo".contains("foo", caseSensitive: false)
        XCTAssertTrue(result)
    }
    
    func textCaseInsensitiveCheckFindsExistingStringCaseInsensitively() {
        let result = "foo".contains("foO", caseSensitive: false)
        XCTAssertTrue(result)
    }
    
    func textCaseInsensitiveCheckDoesNotFindNonExistingString() {
        let result = "foo".contains("foot", caseSensitive: false)
        XCTAssertFalse(result)
    }
}
