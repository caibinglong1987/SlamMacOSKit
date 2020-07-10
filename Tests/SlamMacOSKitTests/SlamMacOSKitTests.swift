import XCTest
@testable import SlamMacOSKit

final class SlamMacOSKitTests: XCTestCase {
    
    static var allTests = [
        ("testKit", testKit),
    ]

    func testKit() {
        XCTAssert(SlamMacOSKit.kitMajorVersion==0 && SlamMacOSKit.kitMinorVersion==0, "Correct Kit Version")
    }
}
