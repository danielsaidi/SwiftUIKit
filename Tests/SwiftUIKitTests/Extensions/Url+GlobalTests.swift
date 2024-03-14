//
//  Url+GlobalTests.swift
//  SwiftUIKitTests
//
//  Created by Daniel Saidi on 2012-08-31.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import Foundation
import SwiftUIKit
import XCTest

final class Url_GlobalTests: XCTestCase {
    
    func testAppStoreUrl() {
        let url = URL.appStoreUrl(forAppId: 123)?.absoluteString
        let expected = "https://itunes.apple.com/app/id\(123)"
        XCTAssertEqual(url, expected)
    }
}
