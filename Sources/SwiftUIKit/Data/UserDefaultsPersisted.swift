//
//  UserDefaultsPersisted.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-04-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

@propertyWrapper
public struct UserDefaultsPersisted<T: Codable> {
    
    public init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    private let key: String
    private let defaultValue: T

    private var defaults: UserDefaults { .standard }

    public var wrappedValue: T {
        get {
            guard let data = defaults.object(forKey: key) as? Data else { return defaultValue }
            let value = try? JSONDecoder().decode(T.self, from: data)
            return value ?? defaultValue
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            defaults.set(data, forKey: key)
        }
    }
}
