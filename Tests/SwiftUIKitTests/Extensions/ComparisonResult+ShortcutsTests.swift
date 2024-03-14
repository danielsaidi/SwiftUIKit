//
//  ComparisonResult+ShortcutsTests.swift
//  SwiftUIKitTests
//
//  Created by Daniel Saidi on 2020-06-09.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import Foundation
import SwiftUIKit
import XCTest

final class ComparisonResult_ShortcutsTests: XCTestCase {
    
    func testOrderShortcutHasCorrectValues() {
        XCTAssertEqual(ComparisonResult.ascending, .orderedAscending)
        XCTAssertEqual(ComparisonResult.descending, .orderedDescending)
    }
}
