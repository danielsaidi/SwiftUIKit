import Foundation

public extension Persisted {

    @available(*, deprecated, message: "Use init with implicit key name instead.")
    init(
        key: String,
        store: UserDefaults = .standard,
        defaultValue: Value
    ) {
        self.init(key, store: store, defaultValue: defaultValue)
    }
}
