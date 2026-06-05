//
//  StorageValue.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-04-24.
//  Copyright © 2023-2026 Daniel Saidi. All rights reserved.
//
//  Inspiration: https://nilcoalescing.com/blog/SaveCustomCodableTypesInAppStorageOrSceneStorage/
//

import Foundation
import SwiftUI

/// This type can be used to wrap any `Codable` type, to let
/// us store it as JSON with `AppStorage` and `SceneStorage`.
///
/// > Important: JSON will be used to encode and decode data.
/// This could cause loss of important data. For instance, a
/// JSON encoded `Color` will lose dynamic information, like
/// dark mode and high contrast variants.
public struct StorageValue<Value: Codable>: RawRepresentable {

    /// Create a storage value.
    public init(_ value: Value? = nil) {
        self.value = value
    }

    /// Create a storage value with a JSON encoded string.
    public init?(rawValue: String) {
        guard
            let data = rawValue.data(using: .utf8),
            let result = try? JSONDecoder().decode(Value.self, from: data)
        else { return nil }
        self = .init(result)
    }

    /// The stored value.
    public var value: Value?
}

public extension StorageValue {

    /// Whether the storage value contains an actual value.
    var hasValue: Bool {
        value != nil
    }

    /// A JSON string representation of the storage value.
    var jsonString: String {
        guard
            let data = try? JSONEncoder().encode(value),
            let result = String(data: data, encoding: .utf8)
        else { return "" }
        return result
    }

    /// A JSON string representation of the storage value.
    var rawValue: String {
        jsonString
    }
}

/// This is a shorthand for ``StorageValue``.
public typealias AppStorageValue = StorageValue

/// This is a shorthand for ``StorageValue``.
public typealias SceneStorageValue = StorageValue


private struct User: Codable, Identifiable {

    var name: String
    var age: Int

    var id: String { name }
}

#Preview {

    struct Preview: View {

        @AppStorage("com.swiftuikit.appstorage.user")
        var userValue = StorageValue<User>()

        var user: User? { userValue.value }

        var body: some View {
            Text(user?.name ?? "-")

            Button("Toggle user") {
                let hasValue = userValue.hasValue
                let daniel = User(name: "Daniel", age: 46)
                userValue.value = hasValue ? nil : daniel
            }
        }
    }

    return Preview()
}
