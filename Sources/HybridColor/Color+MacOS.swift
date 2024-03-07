import SwiftUI
#if os(macOS)
import Cocoa
/**
 * - Note: More colors here: and also different for different light / dark modes: https://sarunw.com/posts/dark-color-cheat-sheet/
 * - Fixme: ⚠️️ add lightGray and darkGray with light and dark support
 * - Fixme: ⚠️️ also add systemPurple etc
 */
extension Color {
   /**
    * A color object with a grayscale value of 1/3 and an alpha value of 1.0.
    * - Note: ref: https://developer.apple.com/documentation/uikit/uicolor/1621952-darkgray
    * - Fixme: ⚠️️ add rgb hue for dark and light
    */
   public static var darkGray: Color {
      let color = NSColor(red: 1.0/3.0, green: 1.0/3.0, blue: 1.0/3.0, alpha: 1.0)
      //
      return .init(light: .init(nsColor: color), dark: .init(nsColor: color))
   }
   public static var lightGray: Color {
      // NSLightGray?
      let color = NSColor(white: 2.0/3.0, alpha: 1.0)
      return .init(color)
   }
   public static var systemGray: Color {
      let nsColor = NSColor(red: 0.56, green: 0.56, blue: 0.58, alpha: 1.0)
      return Color(nsColor)
   }
   public static var systemGray2: Color {
      let light = NSColor(red: 0.68, green: 0.68, blue: 0.7, alpha: 1.0)
      let dark = NSColor(red: 0.39, green: 0.39, blue: 0.4, alpha: 1.0)
      return .init(light: .init(nsColor: light), dark: .init(nsColor: dark))
   }
   public static var systemGray3: Color {
      let light = NSColor(red: 0.78, green: 0.78, blue: 0.8, alpha: 1.0)
      let dark = NSColor(red: 0.28, green: 0.28, blue: 0.29, alpha: 1.0)
      return .init(light: .init(nsColor: light), dark: .init(nsColor: dark))
   }
   public static var systemGray4: Color {
      let light = NSColor(red: 0.82, green: 0.82, blue: 0.84, alpha: 1.0)
      let dark = NSColor(red: 0.23, green: 0.23, blue: 0.24, alpha: 1.0)
      return .init(light: .init(nsColor: light), dark: .init(nsColor: dark))
   }
   public static var systemGray5: Color {
      let light = NSColor(red: 0.9, green: 0.9, blue: 0.92, alpha: 1.0)
      let dark = NSColor(red: 0.17, green: 0.17, blue: 0.18, alpha: 1.0)
      return .init(light: .init(nsColor: light), dark: .init(nsColor: dark))
   }
   public static var systemGray6: Color {
      let light = NSColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.0)
      let dark = NSColor(red: 0.11, green: 0.11, blue: 0.12, alpha: 1.0)
      return .init(light: .init(nsColor: light), dark: .init(nsColor: dark))
   }
}
#endif