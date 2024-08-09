#if os(macOS)
import Cocoa
// macos
// - Fixme: ⚠️️ make these public?
extension NSColor {
   /**
    * Create a UIColor from RGB
    * - Description: This initializer creates an NSColor instance using the provided red, green, blue, and alpha values. The values for red, green, and blue should be between 0 and 255, and the alpha value should be between 0 and 1, where 0 is fully transparent and 1 is fully opaque.
    * - Parameters:
    *   - red: 0-255
    *   - green: 0-255
    *   - blue: 0-255
    *   - a: 0-100
    */
   internal convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
      self.init(
         red: CGFloat(red) / 255.0, // Set the red component to the given value divided by 255.0
         green: CGFloat(green) / 255.0, // Set the green component to the given value divided by 255.0
         blue: CGFloat(blue) / 255.0, // Set the blue component to the given value divided by 255.0
         alpha: a // Set the alpha component to the given value
      )
   }
   /**
    * Create a UIColor from a hex value (E.g 0x000000)
    * - Description: This initializer creates an NSColor instance using the provided hexadecimal value and an alpha component. The hexadecimal value is a 32-bit integer where the first 8 bits represent the red component, the next 8 bits represent the green component, and the last 8 bits represent the blue component. The alpha component should be between 0 and 1, where 0 is fully transparent and 1 is fully opaque.
    * - Parameters:
    *   - hex: 0x000000
    *   - a: 0-1
    */
   internal convenience init(hex: Int, a: CGFloat = 1.0) {
      self.init(
         red: (hex >> 16) & 0xFF, // Extract the red component from the hex value using bit shifting and masking operations
         green: (hex >> 8) & 0xFF, // Extract the green component from the hex value using bit shifting and masking operations
         blue: hex & 0xFF, // Extract the blue component from the hex value using masking operations
         a: a // Set the alpha component to the given value
      )
   }
}
#endif
