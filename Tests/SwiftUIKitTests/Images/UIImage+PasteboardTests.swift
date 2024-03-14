//
//  UIImage+PasteboardTests.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2019-05-28.
//  Copyright © 2021-2024 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUIKit
import UIKit
import XCTest

final class UIImage_PasteboardTests: XCTestCase {

    func testIgnoresCopyingToPasteboardWhenImageHasNoPngData() {
        let image = UIImage()
        let pasteboard = UIPasteboard()
        let result = image.copyToPasteboard(pasteboard)

        XCTAssertFalse(result)
        XCTAssertNil(image.pngData())
        XCTAssertNil(pasteboard.image)
    }

    func testCopiesToPasteboardWhenImageHasPngData() {
        let image = UIImage()
            .resized(to: CGSize(width: 1, height: 1))!
        let pasteboard = UIPasteboard()
        let result = image.copyToPasteboard(pasteboard)

        XCTAssertTrue(result)
        XCTAssertNotNil(image.pngData())
    }
}
#endif
