import Foundation
import SwiftUI

@propertyWrapper
@available(*, deprecated, message: "Use AppStorageCodable instead.")
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

    private static func initialValue<Value: Codable>(
        for key: String,
        in store: UserDefaults
    ) -> Value? {
        guard let data = store.object(forKey: key) as? Data else { return nil }
        return try? JSONDecoder().decode(Value.self, from: data)
    }
}


@available(*, deprecated, message: "Use init with implicit key name instead.")
public extension Persisted {

    init(
        key: String,
        store: UserDefaults = .standard,
        defaultValue: Value
    ) {
        self.init(key, store: store, defaultValue: defaultValue)
    }
}
