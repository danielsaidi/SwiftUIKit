//
//  FontStyleTests.swift
//  SwiftUIKitTests
//
//  Created by Daniel Saidi on 2020-03-11.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit
import XCTest

#if os(iOS)
final class FontStyleTests: XCTestCase {
    
    func testSetupWithName() {
        let style = FontStyle(name: "foo", style: .callout, weight: .bold)
        XCTAssertEqual(style.name, "foo")
        XCTAssertEqual(style.style, .callout)
        XCTAssertEqual(style.weight, .bold)
    }
}
#endif
