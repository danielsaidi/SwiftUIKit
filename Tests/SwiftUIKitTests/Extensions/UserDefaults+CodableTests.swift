//
//  UserDefaults+CodableTests.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-09-23.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import Foundation
import SwiftUIKit
import XCTest

final class UserDefaults_CodableTests: XCTestCase {
    
    var defaults: UserDefaults!
    let key = "user"
    
    override func setUp() {
        defaults = UserDefaults.standard
    }
    
    override func tearDown() {
        defaults.removeObject(forKey: key)
    }
    
    func testDefaultsCanSetAndGetCodableValues() {
        var result: User? = defaults.codable(forKey: key)
        XCTAssertNil(result)
    
        defaults.set("HEJ", forKey: key)
        result = defaults.codable(forKey: key)
        XCTAssertNil(result)
    
        let user = User(name: "Daniel", age: 40)
        defaults.setCodable(user, forKey: key)
        result = defaults.codable(forKey: key)!
        XCTAssertEqual(result, user)
    }
}

private struct User: Codable, Equatable {
    
    let name: String
    let age: Int
}
