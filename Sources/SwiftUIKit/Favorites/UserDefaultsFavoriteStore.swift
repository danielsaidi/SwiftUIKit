//
//  UserDefaultsFavoriteStore.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-09-17.
//  Copyright © 2020-2026 Daniel Saidi. All rights reserved.
//

import Foundation

/// This service implements ``FavoriteStore`` by storing the
/// favorite state in `UserDefaults`.
public final class UserDefaultsFavoriteStore<Item: Identifiable>: FavoriteStore {

    /// Create a service instance.
    ///
    /// - Parameters:
    ///   - defaults: The user defaults instance to use.
    public init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }

    private let defaults: UserDefaults
}

public extension UserDefaultsFavoriteStore {

    func getFavorites() -> [Item.ID] {
        defaults.array(forKey: storeKey) as? [Item.ID] ?? []
    }
    
    func isFavorite(_ item: Item) -> Bool {
        getFavorites().contains(item.id)
    }
    
    func setIsFavorite(_ isFavorite: Bool, for item: Item) {
        var favorites = getFavorites()
        if isFavorite {
            favorites.append(item.id)
        } else {
            favorites.removeAll { $0 == item.id }
        }
        defaults.set(favorites, forKey: storeKey)
    }
    
    func toggleIsFavorite(for item: Item) {
        setIsFavorite(!isFavorite(item), for: item)
    }
}

extension UserDefaultsFavoriteStore {

    var storeKey: String {
        "com.swiftuikit.favorites.\(String(describing: Item.self))"
    }
}
