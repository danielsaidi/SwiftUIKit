//
//  Collection+DistinctTests.swift
//  SwiftUIKitTest
//
//  Created by Daniel Saidi on 2020-06-09.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import SwiftUIKit
import XCTest

final class Collection_DistinctTests: XCTestCase {
    
    func testDistinctRemovesDuplicatesAndPreservesOrder() {
        let array = [1, 1, 1, 2, 2, 3, 1, 2, 3, 1, 1, 1, 3]
        let arrayUnique = array.distinct()
        XCTAssertEqual(arrayUnique, [1, 2, 3])
    }
}
