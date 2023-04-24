//
//  Persisted.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-04-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This property wrapper automatically persists any new values
 to user defaults and sets the initial property value to the
 last persisted value or a default value.

 You can provide this wrapper with a persistency key, a default
 value and an optional store.

 ```swift
 @Persisted(key: "com.myapp.value", defaultValue: .standard, store: .shared)
 private var persistedValue: CodableValueType
 ```

 This property wrapper will properly update any SwiftUI view
 that you use it with.
 */
@propertyWrapper
public struct Persisted<Value: Codable>: DynamicProperty {

    /**
     Create a persisted property wrapper.

     - Parameters:
       - key: The unique key to persist the value to.
       - store: The store to persist the value in.
       - defaultValue: The default value to return when no stored value exists.
     */
    public init(
        _ key: String,
        store: UserDefaults? = .standard,
        defaultValue: Value
    ) {
        self.key = key
        self.store = store ?? .standard
        let initialValue: Value? = Self.initialValue(for: key, in: self.store)
        self._value = State(initialValue: initialValue ?? defaultValue)
    }

    @State
    private var value: Value

    private let key: String
    private let store: UserDefaults

    public var wrappedValue: Value {
        get {
            value
        }
        nonmutating set {
            let data = try? JSONEncoder().encode(newValue)
            store.set(data, forKey: key)
            value = newValue
        }
    }
}

private extension Persisted {

    static func initialValue<Value: Codable>(
        for key: String,
        in store: UserDefaults
    ) -> Value? {
        guard let data = store.object(forKey: key) as? Data else { return nil }
        return try? JSONDecoder().decode(Value.self, from: data)
    }
}
