//
//  DeviceIdentifier.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2016-11-24.
//  Copyright © 2016-2024 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This protocol can be implemented by anything that can get a
 unique device identifier for the current device.
 */
open class DeviceIdentifier {
    
    /**
     Create a device identifier.
     
     - Parameters:
       - keychainService: The service to use for keychain support, by default `.shared`.
       - keychainAccessibility: The keychain accessibility to use, by default `nil`.
       - store: The user defaults to persist ID in, by default `.standard`.
     */
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
    
    /**
     Get a unique device identifier from any of the stores.

     If no identifier exists in the keychain, the identifier
     will use the provided `backupIdentifier` to generate an
     identifier, then persist that id in the device keychain.
     */
    open func getDeviceIdentifier() -> String {
        let keychainId = keychainService.string(for: key, with: accessibility)
        let storeId = store.string(forKey: key)
        let id = keychainId ?? storeId ?? UUID().uuidString
        if keychainId == nil || storeId == nil { setDeviceIdentifier(id) }
        return id
    }
    
    /**
     Remove the unique device identifier from all the stores.
     */
    open func resetDeviceIdentifier() {
        store.removeObject(forKey: key)
        keychainService.removeObject(for: key, with: accessibility)
    }
    
    /**
     Write a unique device identifier to all the stores.
     */
    open func setDeviceIdentifier(_ id: String) {
        store.set(id, forKey: key)
        keychainService.set(id, for: key, with: accessibility)
    }
}

extension DeviceIdentifier {
    
    var key: String { "com.swiftuikit.deviceidentifier" }
}
