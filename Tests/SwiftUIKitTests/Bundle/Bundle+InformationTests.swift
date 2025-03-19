//
//  Bundle+InformationTests.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-05-30.
//  Copyright © 2023-2025 Daniel Saidi. All rights reserved.
//

import Foundation
import SwiftUIKit
import XCTest

final class Bundle_InformationTests: XCTestCase {

    func testCanReadInfoDictionary() {
        let bundle = MyBundle()
        XCTAssertEqual(bundle.buildNumber, "123")
        XCTAssertEqual(bundle.displayName, "SwiftUIKit Tests")
        XCTAssertEqual(bundle.versionNumber, "1.2.3")
    }
}

private class MyBundle: Bundle, @unchecked Sendable {
    
    override var infoDictionary: [String: Any]? {
        [
            String(kCFBundleVersionKey): "1234",
            "CFBundleDisplayName": "SwiftUIKit Tests",
            "CFBundleShortVersionString": "1.2.3"
        ]
    }
}
