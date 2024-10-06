//
//  StandardKeychainService.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2016-11-24.
//  Copyright © 2016-2024 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This class can be used to read from and write to the device
 keychain, using a ``KeychainWrapper``.
 */
open class KeychainService {
    
    public init(
        wrapper: KeychainWrapper = .init()
    ) {
        self.wrapper = wrapper
    }
    
    private let wrapper: KeychainWrapper
    
    
    // MARK: - KeychainReader
    
    open func accessibility(for key: String) -> KeychainItemAccessibility? {
        wrapper.accessibility(for: key)
    }
    
    open func bool(for key: String, with accessibility: KeychainItemAccessibility?) -> Bool? {
        wrapper.bool(for: key, with: accessibility)
    }
    
    open func data(for key: String, with accessibility: KeychainItemAccessibility?) -> Data? {
        wrapper.data(for: key, with: accessibility)
    }
    
    open func dataRef(for key: String, with accessibility: KeychainItemAccessibility?) -> Data? {
        wrapper.dataRef(for: key, with: accessibility)
    }
    
    open func double(for key: String, with accessibility: KeychainItemAccessibility?) -> Double? {
        wrapper.double(for: key, with: accessibility)
    }
    
    open func float(for key: String, with accessibility: KeychainItemAccessibility?) -> Float? {
        wrapper.float(for: key, with: accessibility)
    }
    
    open func hasValue(for key: String, with accessibility: KeychainItemAccessibility?) -> Bool {
        wrapper.hasValue(for: key, with: accessibility)
    }
    
    open func integer(for key: String, with accessibility: KeychainItemAccessibility?) -> Int? {
        wrapper.integer(for: key, with: accessibility)
    }
    
    open func string(for key: String, with accessibility: KeychainItemAccessibility?) -> String? {
        wrapper.string(for: key, with: accessibility)
    }
    
    
    // MARK: - KeychainWriter
    
    @discardableResult
    open func removeObject(for key: String, with accessibility: KeychainItemAccessibility?) -> Bool {
        wrapper.removeObject(for: key, with: accessibility)
    }
    
    open func removeAllKeys() -> Bool {
        wrapper.removeAllKeys()
    }
    
    @discardableResult
    open func set(_ value: Bool, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool {
        wrapper.set(value, for: key, with: accessibility)
    }
    
    @discardableResult
    open func set(_ value: Data, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool {
        wrapper.set(value, for: key, with: accessibility)
    }
    
    @discardableResult
    open func set(_ value: Double, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool {
        wrapper.set(value, for: key, with: accessibility)
    }
    
    @discardableResult
    open func set(_ value: Float, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool {
        wrapper.set(value, for: key, with: accessibility)
    }
    
    @discardableResult
    open func set(_ value: Int, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool {
        wrapper.set(value, for: key, with: accessibility)
    }
    
    @discardableResult
    open func set(_ value: NSCoding, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool {
        wrapper.set(value, for: key, with: accessibility)
    }
    
    @discardableResult
    open func set(_ value: String, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool {
        wrapper.set(value, for: key, with: accessibility)
    }
}

public extension KeychainService {
    
    /// A shared service singleton.
    static var shared: KeychainService { .init() }
}
