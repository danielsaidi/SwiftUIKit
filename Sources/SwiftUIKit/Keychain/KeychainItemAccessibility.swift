//
//  KeychainItemAccessibility.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2016-11-24.
//  Copyright © 2016-2025 Daniel Saidi. All rights reserved.
//
//  Based on https://github.com/jrendel/SwiftKeychainWrapper
//  Created by James Blair on 4/24/16.
//  Copyright © 2016 Jason Rendel. All rights reserved.

@preconcurrency import Foundation

protocol KeychainAttrRepresentable {
    
    var keychainAttrValue: CFString { get }
}

/// This enum defines the various access scopes that a keychain item can use.
///
/// The names follow certain conventions that are defined in the list below:
///
/// * `afterFirstUnlock`
/// Items can't be accessed after restart, until the device has been unlocked once
/// by the user. After this, items remains accessible until the next restart. This is
/// recommended for items that must be available to any background applications
/// or processes.
///
/// * `whenPasscodeSet`
/// Items can only be accessed when the device has been unlocked by the user
/// and a device passcode is set. No items can be stored on device if a passcode
/// is not set. Disabling the passcode will delete all items.
///
/// * `whenUnlocked`
/// Items can only be accessed when the device has been unlocked by the user.
/// This is recommended for items that we only mean to use when the application
/// is active.
///
/// * `*ThisDeviceOnly`
/// Items will not be included in encrypted backup, and are thus not available after
/// restoring apps from backups on a different device.
public enum KeychainItemAccessibility {
    
    case afterFirstUnlock
    case afterFirstUnlockThisDeviceOnly
    case whenPasscodeSetThisDeviceOnly
    case whenUnlocked
    case whenUnlockedThisDeviceOnly
    
    static func accessibilityForAttributeValue(_ keychainAttrValue: CFString) -> KeychainItemAccessibility? {
        lookupTable.first { $0.value == keychainAttrValue }?.key
    }

    static var lookupTable: [KeychainItemAccessibility: CFString] {
        [
            .afterFirstUnlock: kSecAttrAccessibleAfterFirstUnlock,
            .afterFirstUnlockThisDeviceOnly: kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly,
            .whenPasscodeSetThisDeviceOnly: kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly,
            .whenUnlocked: kSecAttrAccessibleWhenUnlocked,
            .whenUnlockedThisDeviceOnly: kSecAttrAccessibleWhenUnlockedThisDeviceOnly
        ]
    }
}

extension KeychainItemAccessibility: KeychainAttrRepresentable {
    
    public var keychainAttrValue: CFString {
        Self.lookupTable[self]!
    }
}
