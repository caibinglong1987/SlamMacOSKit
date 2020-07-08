import XCTest
@testable import SlamMacOSKit

final class SlamMacOSKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SlamMacOSKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
