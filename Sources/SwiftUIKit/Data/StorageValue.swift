//
//  StorageValue.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-04-24.
//  Copyright © 2023-2024 Daniel Saidi. All rights reserved.
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

    public let value: Value
}

/// This is a shorthand for ``StorageValue``.
public typealias AppStorageValue = StorageValue

/// This is a shorthand for ``StorageValue``.
public typealias SceneStorageValue = StorageValue

public extension StorageValue {

    init(_ value: Value) {
        self.value = value
    }

    init?(rawValue: String) {
        guard
            let data = rawValue.data(using: .utf8),
            let result = try? JSONDecoder().decode(Value.self, from: data)
        else { return nil }
        self = .init(result)
    }

    var rawValue: String {
        guard
            let data = try? JSONEncoder().encode(value),
            let result = String(data: data, encoding: .utf8)
        else { return "" }
        return result
    }
}

private struct User: Codable, Identifiable {

    var name: String
    var age: Int

    var id: String { name }
}

#Preview {

    struct Preview: View {

        @AppStorage("com.swiftuikit.appstorage.user")
        var user: AppStorageValue<User>?

        var body: some View {
            Text(user?.value.name ?? "-")

            Button("Toggle user") {
                if user == nil {
                    user = .init(User(name: "Daniel", age: 45))
                } else {
                    user = nil
                }
            }
        }
    }

    return Preview()
}
