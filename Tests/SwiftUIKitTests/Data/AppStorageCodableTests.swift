//
//  AppStorageCodableTests.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-05-30.
//  Copyright © 2023-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit
import XCTest

private struct MyCodable: Codable, Identifiable {

    var name: String

    var id: String { name }
}

private class MyState: ObservableObject {

    @AppStorage("com.example.appstorage.array", store: .standard)
    var array: [MyCodable]?

    @AppStorage("com.example.appstorage.dict", store: .standard)
    var dictionary: [MyCodable.ID: MyCodable]?
}

final class AppStorageCodableTests: XCTestCase {

    func testCanPersistArray() {
        let state1 = MyState()
        XCTAssertNil(state1.array)
        state1.array = [.init(name: "Daniel")]
        let state2 = MyState()
        XCTAssertEqual(state2.array?.first?.name, "Daniel")
        state2.array = nil
    }

    func testCanPersistDictionary() {
        let state1 = MyState()
        XCTAssertNil(state1.dictionary)
        state1.dictionary = ["foo": .init(name: "Daniel")]
        let state2 = MyState()
        XCTAssertEqual(state2.dictionary?["foo"]?.name, "Daniel")
        state2.dictionary = nil
    }
}
