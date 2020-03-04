import XCTest
@testable import SwiftUIKit

final class SwiftUIKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftUIKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
