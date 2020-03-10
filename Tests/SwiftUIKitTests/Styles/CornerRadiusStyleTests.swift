//
//  CornerRadiusStyleTests.swift
//  SwiftUIKitTests
//
//  Created by Daniel Saidi on 2020-03-10.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import XCTest
import SwiftUI
import SwiftUIKit

final class CornerRadiusStyleTests: XCTestCase {
    
    func testSetup() {
        let style = CornerRadiusStyle(radius: 5)
        XCTAssertEqual(style.radius, 5)
    }
}
