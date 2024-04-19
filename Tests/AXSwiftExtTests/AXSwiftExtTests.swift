import XCTest
import AXSwift
@testable import AXSwiftExt

final class AXSwiftExtTests: XCTestCase {
    func testExample() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
    }
    
    func testFindCopy() {
        let app = Application.allForBundleID("com.apple.dt.Xcode").first!
        if let copy = app.findCopy() {
            print("found copy")
        } else {
            print("not found")
        }
    }
}
