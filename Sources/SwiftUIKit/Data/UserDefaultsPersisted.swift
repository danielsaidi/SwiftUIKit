//
//  UserDefaultsPersisted.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-04-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This property wrapper automatically persists any new values
 to user defaults and sets the initial property value to the
 last persisted value or a fallback value.
 */
@propertyWrapper
public struct UserDefaultsPersisted<T: Codable> {
    
    public init(
        key: String,
        store: UserDefaults = .standard,
        defaultValue: T) {
        self.key = key
        self.store = store
        self.defaultValue = defaultValue
    }
    
    private let key: String
    private let store: UserDefaults
    private let defaultValue: T

    public var wrappedValue: T {
        get {
            guard let data = store.object(forKey: key) as? Data else { return defaultValue }
            let value = try? JSONDecoder().decode(T.self, from: data)
            return value ?? defaultValue
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            store.set(data, forKey: key)
        }
    }
}
