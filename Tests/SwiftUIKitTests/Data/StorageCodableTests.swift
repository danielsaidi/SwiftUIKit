//
//  StorageCodableTests.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-05-30.
//  Copyright © 2023-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit
import XCTest

private struct User: Codable, Identifiable {

    var name: String
    var age: Int

    var id: String { name }
}

private class MyState: ObservableObject {

    @AppStorage("com.swiftuikit.appstorage.object", store: .standard)
    var object: StorageValue<User>?

    @AppStorage("com.swiftuikit.appstorage.array", store: .standard)
    var array: [User]?

    @AppStorage("com.swiftuikit.appstorage.dict", store: .standard)
    var dictionary: [User.ID: User]?
}

final class AppStorageCodableTests: XCTestCase {

    private let value = User(name: "Daniel", age: 45)

    func testCanPersistObject() {
        let state1 = MyState()
        XCTAssertNil(state1.object)
        state1.object = .init(value)
        let state2 = MyState()
        XCTAssertEqual(state2.object?.value.name, "Daniel")
        state2.object = nil
    }

    func testCanPersistArray() {
        let state1 = MyState()
        XCTAssertNil(state1.array)
        state1.array = [value]
        let state2 = MyState()
        XCTAssertEqual(state2.array?.first?.name, "Daniel")
        state2.array = nil
    }

    func testCanPersistDictionary() {
        let state1 = MyState()
        XCTAssertNil(state1.dictionary)
        state1.dictionary = ["foo": value]
        let state2 = MyState()
        XCTAssertEqual(state2.dictionary?["foo"]?.name, "Daniel")
        state2.dictionary = nil
    }
}
