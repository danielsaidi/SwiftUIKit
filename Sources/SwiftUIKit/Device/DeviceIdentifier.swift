//
//  DeviceIdentifier.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2016-11-24.
//  Copyright © 2016-2024 Daniel Saidi. All rights reserved.
//

import Foundation

/// This class can generate a unique device identifier, that
/// is persisted even when uninstalling the app.
open class DeviceIdentifier {
    
    /// Create a device identifier.
    ///
    /// - Parameters:
    ///   - keychainService: The service to use for keychain support, by default `.shared`.
    ///   - keychainAccessibility: The keychain accessibility to use, by default `nil`.
    ///   - store: The user defaults to persist ID in, by default `.standard`.
    public init(
        keychainService: KeychainService,
        keychainAccessibility: KeychainItemAccessibility? = nil,
        store: UserDefaults = .standard
    ) {
        self.keychainService = keychainService
        self.accessibility = keychainAccessibility
        self.store = store
    }
    
    private let keychainService: KeychainService
    private let accessibility: KeychainItemAccessibility?
    private let store: UserDefaults
    
    /// Get a unique device identifier from any store.
    ///
    /// If no device identifier exists, this identifier will
    /// generate a new identifier and persist it in both the
    /// keychain and in user defaults.
    open func getDeviceIdentifier() -> String {
        let keychainId = keychainService.string(for: key, with: accessibility)
        let storeId = store.string(forKey: key)
        let id = keychainId ?? storeId ?? UUID().uuidString
        if keychainId == nil || storeId == nil { setDeviceIdentifier(id) }
        return id
    }
    
    /// Remove the unique device identifier from all stores.
    open func resetDeviceIdentifier() {
        store.removeObject(forKey: key)
        keychainService.removeObject(for: key, with: accessibility)
    }
    
    /// Write a unique device identifier to all stores.
    open func setDeviceIdentifier(_ id: String) {
        store.set(id, forKey: key)
        keychainService.set(id, for: key, with: accessibility)
    }
}

extension DeviceIdentifier {
    
    var key: String { "com.swiftuikit.deviceidentifier" }
}
