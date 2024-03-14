//
//  DeviceIdentifierTests.swift
//  SwiftUIKitTests
//
//  Created by Daniel Saidi on 2016-11-24.
//  Copyright © 2016-2024 Daniel Saidi. All rights reserved.
//

import Foundation
import SwiftUIKit
import XCTest

final class KeychainBasedDeviceIdentifierTests: XCTestCase {
    
    var defaults: UserDefaults!
    var keychainService: KeychainService!
    var identifier: DeviceIdentifier!
    
    let key = "com.swiftuikit.deviceidentifier"
    
    override func setUp() {
        defaults = UserDefaults.standard
        keychainService = KeychainService.shared
        identifier = DeviceIdentifier(
            keychainService: keychainService,
            keychainAccessibility: .none,
            store: defaults
        )
        identifier.resetDeviceIdentifier()
    }
    
    func testServiceGeneratesIdAndStoresInAllStores() {
        XCTAssertNil(defaults.string(forKey: key))
        XCTAssertNil(keychainService.string(for: key, with: .none))
        let id = identifier.getDeviceIdentifier()
        XCTAssertEqual(defaults.string(forKey: key), id)
        // XCTAssertEqual(keychainService.string(for: key, with: .none), id)
    }
    
    func testServiceCanWriteCustomKeyToAllStores() {
        XCTAssertNil(defaults.string(forKey: key))
        XCTAssertNil(keychainService.string(for: key, with: .none))
        let id = "abc123"
        identifier.setDeviceIdentifier(id)
        XCTAssertEqual(defaults.string(forKey: key), id)
        // XCTAssertEqual(keychainService.string(for: key, with: .none), id)
    }
}
