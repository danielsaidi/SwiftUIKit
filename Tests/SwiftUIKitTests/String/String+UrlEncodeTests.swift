//
//  String+UrlEncodeTests.swift
//  SwiftUIKitTests
//
//  Created by Daniel Saidi on 2016-12-12.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import SwiftUIKit
import XCTest

final class String_UrlEncodeTests: XCTestCase {
    
    func testUrlEncoding() {
        XCTAssertEqual("foo bar".urlEncoded(), "foo%20bar")
        XCTAssertEqual("?foo=bar".urlEncoded(), "%3Ffoo=bar")
        XCTAssertEqual("foo=bar&baz=123".urlEncoded(), "foo=bar%26baz=123")
        XCTAssertEqual("foo=[bar]".urlEncoded(), "foo=%5Bbar%5D")
        XCTAssertEqual("åäöÅÄÖ".urlEncoded(), "%C3%A5%C3%A4%C3%B6%C3%85%C3%84%C3%96")
    }
}
