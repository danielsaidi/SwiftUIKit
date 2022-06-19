//
//  String+SlugifiedTests.swift
//  SwiftUIKitTests
//
//  Created by Daniel Saidi on 2021-04-22.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI
import XCTest

@testable import SwiftUIKit

final class String_SlugifiedTests: XCTestCase {

    func testRemovesInvalidCharacters() {
        let string = "I'd love an AppleCar!"
        let result = string.slugified()
        XCTAssertEqual(result, "i-d-love-an-applecar")
    }
}
