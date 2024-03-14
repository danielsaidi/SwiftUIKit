//
//  View+ShadowStyleTests.swift
//  SwiftUIKitTests
//
//  Created by Daniel Saidi on 2020-03-10.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit
import XCTest

final class View_ShadowStyleTests: XCTestCase {
    
    func testExtensionExists() {
        let style = ViewShadowStyle(color: .red, radius: 5, x: 7, y: 9)
        let view = Text("Text content")
        let result = view.shadow(style)
        XCTAssertNotNil(result)
    }
}
