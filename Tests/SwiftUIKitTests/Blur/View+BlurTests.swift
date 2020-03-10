//
//  View+BlurTests.swift
//  SwiftUIKitTests
//
//  Created by Daniel Saidi on 2020-03-10.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import XCTest
import SwiftUI
import SwiftUIKit

final class View_BlurTests: XCTestCase {
    
    func testExtensionExists() {
        let view = Text("Text content")
        let result = view.blur(.dark)
        XCTAssertNotNil(result)
    }
}
