//
//  ShadowStyleTests.swift
//  SwiftUIKitTests
//
//  Created by Daniel Saidi on 2020-03-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import XCTest
import SwiftUI
import SwiftUIKit

final class ShadowStyleTests: XCTestCase {
    
    func testSetup() {
        let style = ShadowStyle(color: .red, radius: 5, x: 7, y: 9)
        XCTAssertEqual(style.color, .red)
        XCTAssertEqual(style.radius, 5)
        XCTAssertEqual(style.x, 7)
        XCTAssertEqual(style.y, 9)
    }
    
    func testNoStyle() {
        let style = ShadowStyle.none
        XCTAssertEqual(style.color, .clear)
        XCTAssertEqual(style.radius, 0)
        XCTAssertEqual(style.x, 0)
        XCTAssertEqual(style.y, 0)
    }
}
