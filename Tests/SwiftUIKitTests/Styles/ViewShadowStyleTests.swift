//
//  ViewShadowStyleTests.swift
//  SwiftUIKitTests
//
//  Created by Daniel Saidi on 2020-03-05.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit
import XCTest

final class ViewShadowStyleTests: XCTestCase {
    
    func testSetup() {
        let style = ViewShadowStyle(color: .red, radius: 5, x: 7, y: 9)
        XCTAssertEqual(style.color, .red)
        XCTAssertEqual(style.radius, 5)
        XCTAssertEqual(style.x, 7)
        XCTAssertEqual(style.y, 9)
    }
    
    func testNoStyle() {
        let style = ViewShadowStyle.none
        XCTAssertEqual(style.color, .clear)
        XCTAssertEqual(style.radius, 0)
        XCTAssertEqual(style.x, 0)
        XCTAssertEqual(style.y, 0)
    }
}
