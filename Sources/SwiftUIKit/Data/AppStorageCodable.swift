//
//  AppStorage+Codable.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-04-24.
//  Copyright © 2023 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This protocol can be implemented by any `Codable` type that
 you want to be able to use with `@AppStorage`.

 Just implement this protocol instead of `Codable` then your
 type can be used with `AppStorage`.

 > Important: This currently doesn't behave all that well if
 the properties of an object are used as bindings, e.g. with
 SwiftUI text fields and pickers. For now, you can use it to
 make sure that a codable property is persisted, but without
 binding its properties to any views.
 */
public protocol AppStorageCodable: Codable, RawRepresentable {}

public extension AppStorageCodable {

    init?(rawValue: String) {
        guard
            let data = rawValue.data(using: .utf8),
            let result = try? JSONDecoder().decode(Self.self, from: data)
        else { return nil }
        self = result
    }

    var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
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
        guard let data = try? JSONEncoder().encode(self),
            let result = String(data: data, encoding: .utf8)
        else { return "" }
        return result
    }
}
