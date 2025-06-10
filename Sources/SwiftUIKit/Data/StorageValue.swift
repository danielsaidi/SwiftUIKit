//
//  StorageValue.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-04-24.
//  Copyright © 2023-2025 Daniel Saidi. All rights reserved.
//
//  Inspiration: https://nilcoalescing.com/blog/SaveCustomCodableTypesInAppStorageOrSceneStorage/
//

import Foundation
import SwiftUI

/// This type can wrap any `Codable` type to make it able to
/// store the value in `AppStorage` and `SceneStorage`.
///
/// This type uses `JSONEncoder` and `JSONDecoder` to encode
/// the value to data then decode it back to the source type.
///
/// > Important: JSON encoding may cause important type data
/// to disappear. For instance, JSON encoding a `Color` will
/// not include any information about alternate color values
/// for light and dark mode, high constrasts, etc.
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
