//
//  FontStyleTests.swift
//  SwiftUIKitTests
//
//  Created by Daniel Saidi on 2020-03-11.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import XCTest
import SwiftUI
import SwiftUIKit

final class FontStyleTests: XCTestCase {
    
    func testSetupWithName() {
        let style = FontStyle(name: "foo", style: .callout, weight: .bold)
        XCTAssertEqual(style.name, "foo")
        XCTAssertEqual(style.style, .callout)
        XCTAssertEqual(style.weight, .bold)
    }
    
    func testSetupWithIdentifier() {
        let identifier = TestIdentifier()
        let style = FontStyle(identifier: identifier, style: .callout, weight: .bold)
        XCTAssertEqual(style.name, "MyFont")
        XCTAssertEqual(style.style, .callout)
        XCTAssertEqual(style.weight, .bold)
    }
}

private struct TestIdentifier: FontIdentifier {
    
    var fontName: String { "MyFont" }
}
