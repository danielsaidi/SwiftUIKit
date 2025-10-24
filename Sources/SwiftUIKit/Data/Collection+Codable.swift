//
//  Collection+Codable.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-04-24.
//  Copyright © 2023-2025 Daniel Saidi. All rights reserved.
//
//  Inspiration: https://nilcoalescing.com/blog/SaveCustomCodableTypesInAppStorageOrSceneStorage/
//

import Foundation
import SwiftUI

/// This extension makes `Array` able to store `Codable` types.
///
/// > Important: Values will be encoded and decoded with JSON. This may cause
/// loss of important data. For instance, a JSON encoded `Color` will not include
/// any dynamic color information, like dark mode and high contrast variants.
extension Array: @retroactive RawRepresentable where Element: Codable {

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

/// This extension makes `Dictionary` able to store `Codable` types.
///
/// > Important: Values will be encoded and decoded with JSON. This may cause
/// loss of important data. For instance, a JSON encoded `Color` will not include
/// any dynamic color information, like dark mode and high contrast variants.
extension Dictionary: @retroactive RawRepresentable where Key: Codable, Value: Codable {

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
