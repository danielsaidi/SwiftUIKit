//
//  String+Base64Tests.swift
//  SwiftUIKitTests
//
//  Created by Daniel Saidi on 2016-12-12.
//  Copyright © 2020-2026 Daniel Saidi. All rights reserved.
//

import SwiftUIKit
import XCTest

final class String_Base64Tests: XCTestCase {
    
    func testCanEncodeEmptyString() {
        let string = ""
        let result = string.base64Encoded()
        XCTAssertEqual(result, "")
    }
    
    func canEncodeAndDecodeRegularString() {
        let string = "foo bar"
        let result = string.base64Encoded()?.base64Decoded()
        XCTAssertEqual(result, string)
    }
    
    func canEncodeAndDecodesSwedishChars() {
        let string = "ÅÄÖ åäö"
        let result = string.base64Encoded()?.base64Decoded()
        XCTAssertEqual(result, string)
    }
    
    func canEncodeAndDecodeUnicode() {
        let string = "saaaandii ♡"
        let result = string.base64Encoded()?.base64Decoded()
        XCTAssertEqual(result, string)
    }
    
    func canEncodesAndDecodesEmojis() {
        let string = "😁😂😃"
        let result = string.base64Encoded()?.base64Decoded()
        XCTAssertEqual(result, string)
    }
}
