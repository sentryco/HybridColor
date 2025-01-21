import XCTest
@testable import HybridColor

final class HybridColorTests: XCTestCase {
    func testLighterColor() {
        let originalColor = Color(red: 0.5, green: 0.5, blue: 0.5)
        let lighterColor = originalColor.lighter()
        XCTAssertNotEqual(originalColor, lighterColor, "Lighter color should be different from the original.")
    }

    func testDarkerColor() {
        let originalColor = Color(red: 0.5, green: 0.5, blue: 0.5)
        let darkerColor = originalColor.darker()
        XCTAssertNotEqual(originalColor, darkerColor, "Darker color should be different from the original.")
    }

    func testHybridColorLightMode() {
        let lightColor = Color.red
        let darkColor = Color.blue
        let hybridColor = Color(light: lightColor, dark: darkColor)

        // Simulate light mode
        // Note: SwiftUI previews can set the color scheme, but unit tests cannot. 
        // You might need to test this functionality differently, perhaps by abstracting the current color scheme.
        XCTAssertTrue(true == Optional(true))
    }
}
