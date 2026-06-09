//
//  FavoriteContext.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-09-17.
//  Copyright © 2020-2026 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This class can be used to manage the favorite state of a
/// model type that implements `Identifiable`.
@Observable
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
public final class FavoriteContext<Item: Identifiable> {

    /// Create a default context instance.
    ///
    /// The instance uses a ``UserDefaultsFavoriteStore`` to
    /// store favorites in `UserDefaults`.
    public convenience init() {
        self.init(store: UserDefaultsFavoriteStore<Item>())
    }

    /// Create a context with a custom store.
    ///
    /// - Parameters:
    ///   - store: The store to use to manage favorites.
    public init<Store: FavoriteStore>(
        store: Store
    ) where Store.Item == Item {
        self.favorites = store.getFavorites()
        self._getFavorites = store.getFavorites
        self._isFavorite = store.isFavorite
        self._setIsFavorite = store.setIsFavorite
        self._toggleIsFavorite = store.toggleIsFavorite
        self.showOnlyFavorites = false
        self.showOnlyFavorites = showOnlyFavoritesInternal
    }

    private let _getFavorites: () -> [Item.ID]
    private let _isFavorite: (Item) -> Bool
    private let _setIsFavorite: (Bool, Item) -> Void
    private let _toggleIsFavorite: (Item) -> Void


    /// The item IDs that are currently marked as favorites.
    public private(set) var favorites: [Item.ID] = []

    /// Whether or not to only show favorites.
    public var showOnlyFavorites: Bool {
        didSet {
            showOnlyFavoritesInternal = showOnlyFavorites
        }
    }

    @ObservationIgnored
    @AppStorage("com.deckkit.favorites.showonlyfavorites")
    var showOnlyFavoritesInternal = false
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
public extension FavoriteContext {

    /// Check if there are any favorites.
    var hasFavorites: Bool {
        !favorites.isEmpty
    }

    /// Get all favorites.
    func getFavorites() -> [Item.ID] {
        _getFavorites()
    }
    
    /// Check if a certain item is marked as a favorite.
    func isFavorite(_ item: Item) -> Bool {
        _isFavorite(item)
    }
    
    /// Set the favorite state of a certain item.
    func setIsFavorite(_ isFavorite: Bool, for item: Item) {
        _setIsFavorite(isFavorite, item)
        favorites = getFavorites()
    }
    
    /// Toggle the favorite state of a certain item.
    func toggleIsFavorite(for item: Item) {
        _toggleIsFavorite(item)
        favorites = getFavorites()
    }
}
