//
//  Toast+ShadowTests.swift
//  SwiftUIKitTests
//
//  Created by Daniel Saidi on 2020-03-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import XCTest
import SwiftUI
import SwiftUIKit

final class ToastShadowTests: XCTestCase {
    
    func testProperties() {
        let style = ShadowStyle.standardToast
        XCTAssertEqual(style.color, Color.black.opacity(0.3))
        XCTAssertEqual(style.radius, 5)
        XCTAssertEqual(style.x, 0)
        XCTAssertEqual(style.y, 0)
    }
}
