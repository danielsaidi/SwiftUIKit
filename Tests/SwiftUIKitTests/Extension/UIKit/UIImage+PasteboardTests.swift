//
//  UIImage+PasteboardTests.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2019-05-28.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import MockingKit
import SwiftUIKit
import UIKit
import XCTest

final class UIImage_PasteboardTests: XCTestCase {

    func testIgnoresCopyingToPasteboardWhenImageHasNoPngData() {
        let pasteboard = MockPasteboard()
        let result = UIImage().copyToPasteboard(pasteboard)

        XCTAssertFalse(result)
        XCTAssertFalse(pasteboard.hasCalled(pasteboard.setDataRef))
    }

    func testCopiesToPasteboardWhenImageHasPngData() {
        let pasteboard = MockPasteboard()

        let image = UIImage().resized(to: CGSize(width: 1, height: 1))!
        let result = image.copyToPasteboard(pasteboard)
        let invokes = pasteboard.calls(to: pasteboard.setDataRef)

        XCTAssertTrue(result)
        XCTAssertTrue(pasteboard.hasCalled(pasteboard.setDataRef))
        XCTAssertNotNil(invokes[0].arguments.0)
        XCTAssertEqual(invokes[0].arguments.1, "public.png")
    }
}
#endif
