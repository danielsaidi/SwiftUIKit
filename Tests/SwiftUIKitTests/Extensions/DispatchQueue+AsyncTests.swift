//
//  DispatchQueue+AsyncTests.swift
//  SwiftUIKitTests
//
//  Created by Daniel Saidi on 2020-06-02.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import Foundation
import SwiftUIKit
import XCTest

final class DispatchQueue_AsyncTests: XCTestCase {
    
    let queue = DispatchQueue.main
    
    func testAsyncAfterTimeInterval() {
        var count = 0
        queue.asyncAfter(.microseconds(1)) { count += 1 }
        queue.asyncAfter(.milliseconds(1)) { count += 1 }
        eventually {
            XCTAssertEqual(count, 2)
        }
    }
}

private extension XCTestCase {
    
    func eventually(timeout: TimeInterval = 0.01, closure: @escaping () -> Void) {
        let expectation = self.expectation(description: "")
        expectation.fulfillAfter(timeout)
        self.waitForExpectations(timeout: 60) { _ in
            closure()
        }
    }
}

extension XCTestExpectation {

    func fulfillAfter(_ time: TimeInterval) {
        DispatchQueue.main.asyncAfter(deadline: .now() + time) {
            self.fulfill()
        }
    }
}
