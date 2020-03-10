//
//  View+ShadowStyleTests.swift
//  SwiftUIKitTests
//
//  Created by Daniel Saidi on 2020-03-10.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import XCTest
import SwiftUI
import SwiftUIKit

final class View_ShadowStyleTests: XCTestCase {
    
    func testExtensionExists() {
        let style = ShadowStyle(color: .red, radius: 5, x: 7, y: 9)
        let view = Text("Text content")
        let result = view.shadow(style)
        XCTAssertNotNil(result)
    }
}
