//
//  Array+GroupTests.swift
//  SwiftUIKitTests
//
//  Created by Daniel Saidi on 2017-04-05.
//  Copyright © 2017-2024 Daniel Saidi. All rights reserved.
//

import SwiftUIKit
import XCTest

final class Array_GroupTests: XCTestCase {
    
    private var array: [TestItem] {
        let obj1 = TestItem(name: "Foo", age: 10)
        let obj2 = TestItem(name: "Foo", age: 20)
        let obj3 = TestItem(name: "Bar", age: 20)
        return [obj1, obj2, obj3]
    }
    
    func testGroupingArrayCanGroupByString() {
        let result = array.grouped { $0.name }
        XCTAssertEqual(result["Foo"]?.count, 2)
        XCTAssertEqual(result["Bar"]?.count, 1)
    }
    
    func testGroupingArrayCanGroupByInt() {
        let result = array.grouped { $0.age }
        XCTAssertEqual(result[10]?.count, 1)
        XCTAssertEqual(result[20]?.count, 2)
    }
}

private struct TestItem: Equatable {
    
    var name: String
    var age: Int
}
