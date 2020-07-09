import XCTest
@testable import SlamMacOSKit

final class SlamMacOSKitTests: XCTestCase {
    
    static var allTests = [
        ("testKit", testKit),
    ]

    func testKit() {
        XCTAssert(SlamMacOSKit.kitVersion==1, "Check Version")
    }
}
