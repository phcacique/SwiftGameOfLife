import XCTest
@testable import SwiftGameOfLife

final class SwiftGameOfLifeTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftGameOfLife().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
