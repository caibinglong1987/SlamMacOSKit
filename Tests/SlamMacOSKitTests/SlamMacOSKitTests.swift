import XCTest
@testable import SlamMacOSKit

final class SlamMacOSKitTests: XCTestCase {
    
    func testKit() {
        XCTAssert(SlamMacOSKit.kitVersion==1, "Check Version")
    }

    static var allTests = [
        ("testKit", testKit),
    ]
}
