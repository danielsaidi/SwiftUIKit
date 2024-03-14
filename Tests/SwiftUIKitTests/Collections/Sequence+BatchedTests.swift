//
//  Sequence+BatchTests.swift
//  SwiftUIKitTests
//
//  Created by Daniel Saidi on 2017-05-10.
//  Copyright © 2017-2024 Daniel Saidi. All rights reserved.
//

import SwiftUIKit
import XCTest

final class Sequence_BatchTests: XCTestCase {
    
    func testBatchingArrayCreatesSingleBatchIfBatchSizeExceedsArraySize() {
        let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let batch = array.batched(withBatchSize: 20)

        XCTAssertEqual(batch.count, 1)
        XCTAssertEqual(batch.first!, array)
    }
    
    func testBatchingArrayCreatesManyBatchesIfArraySizeExceedsBatchSize() {
        let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let batch = array.batched(withBatchSize: 3)
        
        XCTAssertEqual(batch.count, 4)
        XCTAssertEqual(batch[0], [1, 2, 3])
        XCTAssertEqual(batch[1], [4, 5, 6])
        XCTAssertEqual(batch[2], [7, 8, 9])
        XCTAssertEqual(batch[3], [10])
    }
    
    func testBatchingArrayPreservesIdentability() {
        let item1 = TestItem(name: "1")
        let item2 = TestItem(name: "2")
        let item3 = TestItem(name: "3")
        let item4 = TestItem(name: "4")
        
        let array = [item1, item2, item3, item4]
        let batch = array.batched(withBatchSize: 2)
        
        XCTAssertEqual(batch.count, 2)
        XCTAssertEqual(batch.last!, [item3, item4])
    }
}

private struct TestItem: Equatable {
    
    let name: String
}
