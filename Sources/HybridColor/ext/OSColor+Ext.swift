import SwiftUI
#if os(iOS)
import UIKit
#elseif os(macOS)
import Cocoa
#endif
/**
 * SwiftUI support
 */
extension Color {
   /**
    * Initializes a Color instance from a hexadecimal value and an alpha component.
    * - Description: This function creates a Color instance by extracting the red, green, and blue components from the given hexadecimal value and setting the alpha component to the specified value.
    * - Parameters:
    *   - hex: The hexadecimal value representing the color. This is a 32-bit integer where the first 8 bits represent the red component, the next 8 bits represent the green component, and the last 8 bits represent the blue component.
    *   - a: The alpha component of the color, ranging from 0 (transparent) to 1 (opaque).
    */
   public init(hex: Int, a: CGFloat = 1.0) {
      #if os(iOS)
      self.init(uiColor: .init(hex: hex, a: a))
      #elseif os(macOS)
      self.init(nsColor: .init(hex: hex, a: a))
      #endif
   }
}
