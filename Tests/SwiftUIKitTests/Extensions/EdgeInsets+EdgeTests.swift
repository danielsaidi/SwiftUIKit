//
//  EdgeInsets+EdgeTests.swift
//  SwiftUIKitTests
//
//  Created by Daniel Saidi on 2020-09-15.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import XCTest
import SwiftUI
import SwiftUIKit

final class EdgeInsets_EdgeTests: XCTestCase {
    
    func testEdges() {
        let insets = EdgeInsets(top: 1, leading: 2, bottom: 3, trailing: 4)
        XCTAssertEqual(insets.inset(for: .top), 1)
        XCTAssertEqual(insets.inset(for: .leading), 2)
        XCTAssertEqual(insets.inset(for: .bottom), 3)
        XCTAssertEqual(insets.inset(for: .trailing), 4)
    }
}
