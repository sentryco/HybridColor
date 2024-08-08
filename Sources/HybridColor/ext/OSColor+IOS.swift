#if os(iOS)
import UIKit
/**
 * iOS
 * - Fixme: ⚠️️ check legacy for doc, similar code etc
 */
extension UIColor {
   /**
    * RGBA support for UIColor
    * - Description: This initializer creates a UIColor instance using the provided red, green, blue, and alpha values. The values for red, green, and blue should be between 0 and 255, and the alpha value should be between 0 and 1, where 0 is fully transparent and 1 is fully opaque.
    * - Parameters:
    *   - red: 0-255
    *   - green: 0-255
    *   - blue: 0-255
    *   - a: 0-100
    */
   convenience init(red: Int, green: Int, blue: Int, a: CGFloat) {
      assert(red >= 0 && red <= 255, "Invalid red component") // Assert that the red component is between 0 and 255
      assert(green >= 0 && green <= 255, "Invalid green component") // Assert that the green component is between 0 and 255
      assert(blue >= 0 && blue <= 255, "Invalid blue component") // Assert that the blue component is between 0 and 255
      self.init(
         red: CGFloat(red) / 255.0, // Set the red component to the given value divided by 255.0
         green: CGFloat(green) / 255.0, // Set the green component to the given value divided by 255.0
         blue: CGFloat(blue) / 255.0, // Set the blue component to the given value divided by 255.0
         alpha: a // Set the alpha component to the given value
      ) // Initialize a new instance of NSColor with the given red, green, blue, and alpha components
   }
   /**
    * Create a UIColor from a hex value (E.g 0x000000)
    * - Description: This initializer creates a UIColor instance using the provided hexadecimal value and an alpha component. The hexadecimal value is a 32-bit integer where the first 8 bits represent the red component, the next 8 bits represent the green component, and the last 8 bits represent the blue component. The alpha component should be between 0 and 1, where 0 is fully transparent and 1 is fully opaque.
    * - Parameters:
    *   - hex: 0x000000
    *   - a: 0-1
    */
   convenience init(hex: Int, a: CGFloat = 1.0) {
      // self.init(red: (rgb >> 16) & 0xFF, green: (rgb >> 8) & 0xFF, blue: rgb & 0xFF)
      self.init(
         red: (hex >> 16) & 0xFF, // Extract the red component from the hex value using bit shifting and masking operations
         green: (hex >> 8) & 0xFF, // Extract the green component from the hex value using bit shifting and masking operations
         blue: hex & 0xFF, // Extract the blue component from the hex value using masking operations
         a: a // Set the alpha component to the given value
      )
   }
}
#endif
