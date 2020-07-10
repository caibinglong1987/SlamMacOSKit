import XCTest
@testable import SlamMacOSKit

final class SlamMacOSKitTests: XCTestCase {
    
    static var allTests = [
        ("testKit", testKit),
    ]

    func testKit() {
        let (major, minor, _) = SlamMacOSKit.kitVersion
        XCTAssert(major==0 && minor==0, "Correct Kit Version")
    }

}
