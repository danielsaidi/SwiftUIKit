//
//  View+CornerRadiusStyleTests.swift
//  SwiftUIKitTests
//
//  Created by Daniel Saidi on 2020-03-10.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import XCTest
import SwiftUI
import SwiftUIKit

final class View_CornerRadiusStyleTests: XCTestCase {
    
    func testExtensionExists() {
        let style = CornerRadiusStyle(radius: 5)
        let view = Text("Text content")
        let result = view.cornerRadius(style)
        XCTAssertNotNil(result)
    }
}
