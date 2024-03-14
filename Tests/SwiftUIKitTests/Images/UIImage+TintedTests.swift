//
//  UIImage+TintedTests.swift
//  KeyboardKitTests
//
//  Created by Daniel Saidi on 2019-05-06.
//  Copyright © 2021-2024 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUIKit
import UIKit
import XCTest

final class UIImage_TintedTests: XCTestCase {

    func testCanGenerateTintedImage() {
        let image = UIImage().resized(to: CGSize(width: 100, height: 100))!
        let tinted = image.tinted(with: .red, blendMode: .clear)
        XCTAssertNotNil(tinted)
    }
}
#endif
