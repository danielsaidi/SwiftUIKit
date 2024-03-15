//
//  StorageCodable.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-04-24.
//  Copyright © 2023-2024 Daniel Saidi. All rights reserved.
//
//  Inspiration: https://nilcoalescing.com/blog/SaveCustomCodableTypesInAppStorageOrSceneStorage/
//

import Foundation

/**
 This protocol can be implemented instead of `Codable`, when
 you need to store a type in `AppStorage` or `SceneStorage`.
 
 This is a convenience protocol that automatically makes the
 implementing type implement `RawRepresentable`, which means
 that it can be stored in various SwiftUI storages.
 
 The `RawRepresentable` implementations use the `JSONEncoder`
 and `JSONDecoder` to encode and decode the types.
 
 The reason to why `RawRepresentable` is not just applied to
 `Codable` directly, is that some codable types may not want
 to use JSON encoding and decoding.
 
 > Important: Keep in mind that JSON encoding may affect the
 object. For instance, JSON encoding a dynamic `Color` value
 to a raw data representation will remove any light and dark
 mode support, support for high constrasts etc.
 */
public protocol StorageCodable: Codable, RawRepresentable {}

public extension StorageCodable {
    
    init?(rawValue: String) {
        guard
            let data = rawValue.data(using: .utf8),
            let result = try? JSONDecoder().decode(Self.self, from: data)
        else { return nil }
        self = result
    }

    var rawValue: String {
        guard
            let data = try? JSONEncoder().encode(self),
            let result = String(data: data, encoding: .utf8)
        else { return "" }
        return result
    }
}

extension Array: RawRepresentable where Element: Codable {

    public init?(rawValue: String) {
        guard
            let data = rawValue.data(using: .utf8),
            let result = try? JSONDecoder().decode([Element].self, from: data)
        else { return nil }
        self = result
    }

    public var rawValue: String {
        guard
            let data = try? JSONEncoder().encode(self),
            let result = String(data: data, encoding: .utf8)
        else { return "" }
        return result
    }
}

extension Dictionary: RawRepresentable where Key: Codable, Value: Codable {

    public init?(rawValue: String) {
        guard
            let data = rawValue.data(using: .utf8),
            let result = try? JSONDecoder().decode([Key: Value].self, from: data)
        else { return nil }
        self = result
    }

    public var rawValue: String {
        guard
            let data = try? JSONEncoder().encode(self),
            let result = String(data: data, encoding: .utf8)
        else { return "{}" }
        return result
    }
}
