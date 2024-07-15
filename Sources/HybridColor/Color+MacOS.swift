import SwiftUI
#if os(macOS)
import Cocoa
/**
 * - Note: More colors here: and also different for different light / dark modes: https://sarunw.com/posts/dark-color-cheat-sheet/
 * - Fixme: ⚠️️ Add lightGray and darkGray with light and dark support
 * - Fixme: ⚠️️ Also add systemPurple etc
 */
extension NSColor {
   public static var darkGray: NSColor {
      .init(red: 1.0/3.0, green: 1.0/3.0, blue: 1.0/3.0, alpha: 1.0)
   }
   public static var lightGray: NSColor {
      .init(white: 2.0/3.0, alpha: 1.0)
   }
   public static var systemGray: NSColor {
      .init(red: 0.56, green: 0.56, blue: 0.58, alpha: 1.0)
   }
   public typealias LightDark = (light: NSColor, dark: NSColor)
   public static var systemGray2: LightDark {
      let light = NSColor(red: 0.68, green: 0.68, blue: 0.7, alpha: 1.0)
      let dark = NSColor(red: 0.39, green: 0.39, blue: 0.4, alpha: 1.0)
      return (light, dark)
   }
   public static var systemGray3: LightDark {
      let light = NSColor(red: 0.68, green: 0.68, blue: 0.7, alpha: 1.0)
      let dark = NSColor(red: 0.39, green: 0.39, blue: 0.4, alpha: 1.0)
      return (light, dark)
   }
   public static var systemGray4: LightDark {
      let light = NSColor(red: 0.82, green: 0.82, blue: 0.84, alpha: 1.0)
      let dark = NSColor(red: 0.23, green: 0.23, blue: 0.24, alpha: 1.0)
      return (light, dark)
   }
   public static var systemGray5: LightDark {
      let light = NSColor(red: 0.9, green: 0.9, blue: 0.92, alpha: 1.0)
      let dark = NSColor(red: 0.17, green: 0.17, blue: 0.18, alpha: 1.0)
      return (light, dark)
   }
   public static var systemGray6: LightDark {
      let light = NSColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.0)
      let dark = NSColor(red: 0.11, green: 0.11, blue: 0.12, alpha: 1.0)
      return (light, dark)
   }
}
extension Color {
   /**
    * A color object with a grayscale value of 1/3 and an alpha value of 1.0.
    * - Note: ref: https://developer.apple.com/documentation/uikit/uicolor/1621952-darkgray
    * - Note: We can't manipulate hybrid color types with lighter darker methods. Adjustments needs to be done pre-hybrid init
    * - Fixme: ⚠️️ add rgb hue for dark and light
    * - Fixme: ⚠️️ document these, use copilot
    */
   public static var darkGray: Color {
      .init(
         light: .init(nsColor: NSColor.darkGray),
         dark: .init(nsColor: NSColor.darkGray)
      )
   }
   public static var lightGray: Color {
      // - Fixme: ⚠️️ look into: NSLightGray? or ask copilot?
      .init(NSColor.lightGray)
   }
   public static var systemGray: Color {
      .init(NSColor.systemGray)
   }
   public static var systemGray2: Color {
      .init(
         light: .init(nsColor: NSColor.systemGray2.light),
         dark: .init(nsColor:NSColor.systemGray2.light)
      )
   }
   public static var systemGray3: Color {
      .init(
         light: .init(nsColor: NSColor.systemGray3.light),
         dark: .init(nsColor: NSColor.systemGray3.light)
      )
   }
   public static var systemGray4: Color {
      .init(
         light: .init(nsColor: NSColor.systemGray4.light),
         dark: .init(nsColor: NSColor.systemGray4.light)
      )
   }
   public static var systemGray5: Color {
      .init(
         light: .init(nsColor: NSColor.systemGray5.light),
         dark: .init(nsColor: NSColor.systemGray5.light)
      )
   }
   public static var systemGray6: Color {
      .init(
         light: .init(nsColor: NSColor.systemGray6.light),
         dark: .init(nsColor: NSColor.systemGray6.light)
      )
   }
}
#endif
