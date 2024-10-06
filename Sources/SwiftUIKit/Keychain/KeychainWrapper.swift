//
//  KeychainWrapper.swift
//  SwiftUIKit

//  Created by Daniel Saidi on 2016-11-24.
//  Copyright © 2016-2024 Daniel Saidi. All rights reserved.
//
//  Based on https://github.com/jrendel/SwiftKeychainWrapper
//  Created by Jason Rendel on 9/23/14.
//  Copyright © 2014 Jason Rendel. All rights reserved.

import Foundation

private let paramSecMatchLimit = kSecMatchLimit as String
private let paramSecReturnData = kSecReturnData as String
private let paramSecReturnPersistentRef = kSecReturnPersistentRef as String
private let paramSecValueData = kSecValueData as String
private let paramSecAttrAccessible = kSecAttrAccessible as String
private let paramSecClass = kSecClass as String
private let paramSecAttrService = kSecAttrService as String
private let paramSecAttrGeneric = kSecAttrGeneric as String
private let paramSecAttrAccount = kSecAttrAccount as String
private let paramSecAttrAccessGroup = kSecAttrAccessGroup as String
private let paramSecReturnAttributes = kSecReturnAttributes as String


/**
 This class help make device keychain access easier in Swift.
 It is designed to make accessing the Keychain services more
 like using `NSUserDefaults`, which is much more familiar to
 developers in general.
 
 `serviceName` is used for `kSecAttrService`, which uniquely
 identifies keychain accessors. If no name is specified, the
 value defaults to the current bundle identifier.
 
 `accessGroup` is used for `kSecAttrAccessGroup`. This value
 is used to identify which keychain access group an entry is
 belonging to. This allows you to use `KeychainWrapper` with
 shared keychain access between different applications.
 
 `NOTE` In SwiftKit, you can use a `StandardKeychainService`
 to isolate keychain access from contract design.
 */
open class KeychainWrapper {
    
    
    // MARK: - Initialization
    
    /// Create a standard instance of this class.
    public convenience init() {
        let id = Bundle.main.bundleIdentifier
        let fallback = "com.swiftkit.keychain"
        self.init(serviceName: id ?? fallback)
    }
    
    /// Create a custom instance of this class.
    ///
    /// The `serviceName` is used to uniquely identify every
    /// key that has been stored in the keychain, using this
    /// wrapper instance.
    ///
    /// Use matching access groups between applications when
    /// you want to allow shared keychain access.
    ///
    /// - Parameters:
    ///   - serviceName: The service name to use for this instance.
    ///   - accessGroup: An optional, unique access group for this instance.
    public init(
        serviceName: String,
        accessGroup: String? = nil
    ) {
        self.serviceName = serviceName
        self.accessGroup = accessGroup
    }
    
    
    // MARK: - Properties
    
    /// The service name to use for this instance.
    private let serviceName: String
    
    /// An optional, unique access group for this instance.
    private let accessGroup: String?
    
    
    // MARK: - KeychainReader
    
    open func accessibility(for key: String) -> KeychainItemAccessibility? {
        var dict = setupKeychainQueryDictionary(forKey: key)
        var result: AnyObject?
        dict.removeValue(forKey: paramSecAttrAccessible)
        dict[paramSecMatchLimit] = kSecMatchLimitOne
        dict[paramSecReturnAttributes] = kCFBooleanTrue
        let status = withUnsafeMutablePointer(to: &result) {
            SecItemCopyMatching(dict as CFDictionary, UnsafeMutablePointer($0))
        }
        if status == noErr,
            let dict = result as? [String: AnyObject],
            let val = dict[paramSecAttrAccessible] as? String {
            return KeychainItemAccessibility.accessibilityForAttributeValue(val as CFString)
        }
        return nil
    }
    
    open func bool(for key: String, with accessibility: KeychainItemAccessibility? = nil) -> Bool? {
        number(for: key, with: accessibility)?.boolValue
    }
    
    open func data(for key: String, with accessibility: KeychainItemAccessibility? = nil) -> Data? {
        var dict = setupKeychainQueryDictionary(forKey: key, with: accessibility)
        var result: AnyObject?
        dict[paramSecMatchLimit] = kSecMatchLimitOne
        dict[paramSecReturnData] = kCFBooleanTrue
        let status = withUnsafeMutablePointer(to: &result) {
            SecItemCopyMatching(dict as CFDictionary, UnsafeMutablePointer($0))
        }
        return status == noErr ? result as? Data: nil
    }
    
    open func double(for key: String, with accessibility: KeychainItemAccessibility? = nil) -> Double? {
        number(for: key, with: accessibility)?.doubleValue
    }
    
    open func float(for key: String, with accessibility: KeychainItemAccessibility? = nil) -> Float? {
        number(for: key, with: accessibility)?.floatValue
    }
    
    open func hasValue(for key: String, with accessibility: KeychainItemAccessibility? = nil) -> Bool {
        data(for: key, with: accessibility) != nil
    }
    
    open func integer(for key: String, with accessibility: KeychainItemAccessibility? = nil) -> Int? {
        number(for: key, with: accessibility)?.intValue
    }
    
    open func number(for key: String, with accessibility: KeychainItemAccessibility? = nil) -> NSNumber? {
        object(for: key, with: accessibility)
    }
    
    open func object<T: NSObject & NSCoding>(for key: String, with accessibility: KeychainItemAccessibility? = nil) -> T? {
        guard let keychainData = data(for: key, with: accessibility) else { return nil }
        return try? NSKeyedUnarchiver.unarchivedObject(ofClass: T.self, from: keychainData)
    }
    
    open func string(for key: String, with accessibility: KeychainItemAccessibility? = nil) -> String? {
        guard let keychainData = data(for: key, with: accessibility) else { return nil }
        return String(data: keychainData, encoding: String.Encoding.utf8) as String?
    }
    
    open func dataRef(for key: String, with accessibility: KeychainItemAccessibility? = nil) -> Data? {
        var dict = setupKeychainQueryDictionary(forKey: key, with: accessibility)
        var result: AnyObject?
        dict[paramSecMatchLimit] = kSecMatchLimitOne
        dict[paramSecReturnPersistentRef] = kCFBooleanTrue
        let status = withUnsafeMutablePointer(to: &result) {
            SecItemCopyMatching(dict as CFDictionary, UnsafeMutablePointer($0))
        }
        return status == noErr ? result as? Data: nil
    }
    
    
    // MARK: - KeychainWriter
    
    @discardableResult
    open func set(_ value: Int, for key: String, with accessibility: KeychainItemAccessibility? = nil) -> Bool {
        set(NSNumber(value: value), for: key, with: accessibility)
    }
    
    @discardableResult
    open func set(_ value: Float, for key: String, with accessibility: KeychainItemAccessibility? = nil) -> Bool {
        set(NSNumber(value: value), for: key, with: accessibility)
    }
    
    @discardableResult
    open func set(_ value: Double, for key: String, with accessibility: KeychainItemAccessibility? = nil) -> Bool {
        set(NSNumber(value: value), for: key, with: accessibility)
    }
    
    @discardableResult
    open func set(_ value: Bool, for key: String, with accessibility: KeychainItemAccessibility? = nil) -> Bool {
        set(NSNumber(value: value), for: key, with: accessibility)
    }
    
    @discardableResult
    open func set(_ value: String, for key: String, with accessibility: KeychainItemAccessibility? = nil) -> Bool {
        guard let data = value.data(using: .utf8) else { return false }
        return set(data, for: key, with: accessibility)
    }
    
    @discardableResult
    open func set(_ value: NSCoding, for key: String, with accessibility: KeychainItemAccessibility? = nil) -> Bool {
        guard let data = try? NSKeyedArchiver.archivedData(withRootObject: value, requiringSecureCoding: false) else { return false }
        return set(data, for: key, with: accessibility)
    }
    
    @discardableResult
    open func set(_ value: Data, for key: String, with accessibility: KeychainItemAccessibility? = nil) -> Bool {
        var dict: [String: Any] = setupKeychainQueryDictionary(forKey: key, with: accessibility)
        dict[paramSecValueData] = value
        
        if let accessibility = accessibility {
            dict[paramSecAttrAccessible] = accessibility.keychainAttrValue
        } else {
            // Assign default protection - Protect the keychain entry so it's only valid when the device is unlocked
            dict[paramSecAttrAccessible] = KeychainItemAccessibility.whenUnlocked.keychainAttrValue
        }
        
        let status = SecItemAdd(dict as CFDictionary, nil)
        if status == errSecDuplicateItem {
            return update(value, forKey: key, with: accessibility)
        }
        return status == errSecSuccess
    }

    @discardableResult
    open func removeObject(for key: String, with accessibility: KeychainItemAccessibility? = nil) -> Bool {
        let keychainQueryDictionary: [String: Any] = setupKeychainQueryDictionary(forKey: key, with: accessibility)
        let status = SecItemDelete(keychainQueryDictionary as CFDictionary)
        return status == errSecSuccess
    }
    
    /// Remove all items from the device keychain, that were
    /// added by this wrapper.
    open func removeAllKeys() -> Bool {
        var dict: [String: Any] = [paramSecClass: kSecClassGenericPassword]
        dict[paramSecAttrService] = serviceName
        if let accessGroup {
            dict[paramSecAttrAccessGroup] = accessGroup
        }
        let status = SecItemDelete(dict as CFDictionary)
        return status == errSecSuccess
    }
    
    /// Remove all items from the device keychain, including
    /// entries that were not added by this wrapper.
    ///
    /// > Warning: This will remove all data from the store.
    open class func wipeKeychain() {
        deleteKeychainSecClass(kSecClassGenericPassword)    // Generic password items
        deleteKeychainSecClass(kSecClassInternetPassword)   // Internet password items
        deleteKeychainSecClass(kSecClassCertificate)        // Certificate items
        deleteKeychainSecClass(kSecClassKey)                // Cryptographic key items
        deleteKeychainSecClass(kSecClassIdentity)           // Identity items
    }
}


// MARK: - Private Methods

private extension KeychainWrapper {
    
    /// Remove all items for a given Keychain Item Class.
    @discardableResult
    class func deleteKeychainSecClass(_ secClass: AnyObject) -> Bool {
        let query = [paramSecClass: secClass]
        let status = SecItemDelete(query as CFDictionary)
        return status == errSecSuccess
    }
    
    /// Update all data that's associated with a certain key.
    ///
    /// Any existing data will be overwritten.
    func update(
        _ value: Data,
        forKey key: String,
        with accessibility: KeychainItemAccessibility? = nil
    ) -> Bool {
        var keychainQueryDictionary: [String: Any] = setupKeychainQueryDictionary(forKey: key, with: accessibility)
        let updateDictionary = [paramSecValueData: value]
        if let accessibility = accessibility {
            keychainQueryDictionary[paramSecAttrAccessible] = accessibility.keychainAttrValue
        }
        let status = SecItemUpdate(keychainQueryDictionary as CFDictionary, updateDictionary as CFDictionary)
        return status == errSecSuccess
    }
    
    /// Setup the keychain query dictionary.
    ///
    /// The dictionary is used to access the keychain on iOS
    /// for a certain key, taking into account service names
    /// and access groups, whenever set.
    ///
    /// - Parameters:
    ///   - forKey: The key this query is for.
    ///   - accessibility: Optional keychain accessibility.
    ///
    /// - returns: A dictionary with all properties needed to access the keychain on iOS.
    func setupKeychainQueryDictionary(
        forKey key: String,
        with accessibility: KeychainItemAccessibility? = nil
    ) -> [String: Any] {
        var dict: [String: Any] = [paramSecClass: kSecClassGenericPassword]
        dict[paramSecAttrService] = serviceName
        if let accessibility = accessibility {
            dict[paramSecAttrAccessible] = accessibility.keychainAttrValue
        }
        if let accessGroup = self.accessGroup {
            dict[paramSecAttrAccessGroup] = accessGroup
        }
        let encodedIdentifier = key.data(using: String.Encoding.utf8)
        dict[paramSecAttrGeneric] = encodedIdentifier
        dict[paramSecAttrAccount] = encodedIdentifier
        return dict
    }
}
