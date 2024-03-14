//
//  ValidationRegexTests.swift
//  SwiftUIKitTests
//
//  Created by Daniel Saidi on 2020-06-09.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import SwiftUIKit
import XCTest

final class ValidationRegexTests: XCTestCase {
    
    func testCanValidateEmail() {
        XCTAssertTrue("foobar@baz.com".isValid(.email))
        XCTAssertTrue("foo1.bar2@baz.com".isValid(.email))
        XCTAssertTrue("foo.bar@gmail.com".isValid(.email))
        
        XCTAssertTrue("foobar@baz.co".isValid(.email))
        XCTAssertTrue("foobar@baz.com".isValid(.email))
        XCTAssertTrue("foo1.bar2@baz.comm".isValid(.email))
        XCTAssertTrue("foo.bar@gmail.commmmmmmmmmmmmmmm".isValid(.email))
        
        XCTAssertFalse("foobar".isValid(.email))
        XCTAssertFalse("foo1.bar2@".isValid(.email))
        XCTAssertFalse("foo.bar@gmail".isValid(.email))
        XCTAssertFalse("foobar@baz.c".isValid(.email))
    }
}
