//
//  Collection+ContentTests.swift
//  SwiftUIKitTest
//
//  Created by Daniel Saidi on 2020-06-09.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import SwiftUIKit
import XCTest

final class Collection_ContentTests: XCTestCase {
    
    func testHasContentOnlyReturnsTrueWhenCollectionHasContent() {
        XCTAssertTrue(["whatever"].hasContent)
        XCTAssertFalse([String]().hasContent)
    }
}
