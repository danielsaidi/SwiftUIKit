//
//  JSONDecoder+DateTests.swift
//  SwiftUIKitTests
//
//  Created by Daniel Saidi on 2018-09-05.
//  Copyright © 2018-2024 Daniel Saidi. All rights reserved.
//

import Foundation
import SwiftUIKit
import XCTest

final class JSONDecoder_DateTests: XCTestCase {
    
    func testCanDecodeIso8601DateWithSeconds() {
        let string = "{ \"date\": \"2017-02-24T01:02:03+04:05\" }"
        let data = string.data(using: .utf8)!
        let decoder = JSONDecoder.iso8601
        let obj = try? decoder.decode(TestClass.self, from: data)
        XCTAssertNotNil(obj)
    }
    
    func testCanDecodeIso8601DateWithMilliseconds() {
        let string = "{ \"date\": \"2018-09-05T21:55:16.1184588Z\" }"
        let data = string.data(using: .utf8)!
        let decoder = JSONDecoder.iso8601
        let obj = try? decoder.decode(TestClass.self, from: data)
        XCTAssertNotNil(obj)
    }
}

private class TestClass: Codable {
    
    init(date: Date) {
        self.date = date
    }
    
    var date: Date
    
    enum CodingKeys: String, CodingKey {
        case date
    }
}
