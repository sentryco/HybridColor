import SwiftUI
#if os(macOS)
import Cocoa
/**
 * - Description: This extension provides NSColor compatibility for Color by adding static variables and methods that represent various shades of system grays, which are adaptable to different appearances in macOS.
 * - Note: More colors here: and also different for different light / dark modes: https://sarunw.com/posts/dark-color-cheat-sheet/
 * - Fixme: ⚠️️ Add lightGray and darkGray with light and dark support
 * - Fixme: ⚠️️ Also add systemPurple etc
 */
extension NSColor {
   /**
    * - Note: NSColor.darkGray is already occupid etc
    */
   public static var _darkGray: NSColor {
      .init(red: 1.0/3.0, green: 1.0/3.0, blue: 1.0/3.0, alpha: 1.0)
   }
   /**
    * - Note: NSColor.lightGray is already occupid etc
    */
   public static var _lightGray: NSColor {
      .init(white: 2.0/3.0, alpha: 1.0)
   }
   /**
    * A neutral gray color that adapts to the current appearance settings.
    */
   public static var systemGray: NSColor {
      .init(red: 0.56, green: 0.56, blue: 0.58, alpha: 1.0)
   }
   /**
    * A tuple representing a color that adapts to light and dark appearance settings.
    */
   public typealias LightDark = (light: NSColor, dark: NSColor)
   /**
    * A second-level system gray color that adapts to light and dark appearance settings.
    */
   public static var systemGray2: LightDark {
      let light = NSColor(red: 0.68, green: 0.68, blue: 0.7, alpha: 1.0)
      let dark = NSColor(red: 0.39, green: 0.39, blue: 0.4, alpha: 1.0)
      return (light, dark)
   }
   /**
    * A third-level system gray color that adapts to light and dark appearance settings.
    */
   public static var systemGray3: LightDark {
      let light = NSColor(red: 0.68, green: 0.68, blue: 0.7, alpha: 1.0)
      let dark = NSColor(red: 0.39, green: 0.39, blue: 0.4, alpha: 1.0)
      return (light, dark)
   }
   /**
    * A fourth-level system gray color that adapts to light and dark appearance settings.
    */
   public static var systemGray4: LightDark {
      let light = NSColor(red: 0.82, green: 0.82, blue: 0.84, alpha: 1.0)
      let dark = NSColor(red: 0.23, green: 0.23, blue: 0.24, alpha: 1.0)
      return (light, dark)
   }
   /**
    * A fifth-level system gray color that adapts to light and dark appearance settings.
    */
   public static var systemGray5: LightDark {
      let light = NSColor(red: 0.9, green: 0.9, blue: 0.92, alpha: 1.0)
      let dark = NSColor(red: 0.17, green: 0.17, blue: 0.18, alpha: 1.0)
      return (light, dark)
   }
   /**
    * A sixth-level system gray color that adapts to light and dark appearance settings.
    * - Description: This color is a very light gray in light mode and a very dark gray in dark mode, providing a subtle contrast for UI elements.
    */
   public static var systemGray6: LightDark {
      let light = NSColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.0)
      let dark = NSColor(red: 0.11, green: 0.11, blue: 0.12, alpha: 1.0)
      return (light, dark)
   }
}
/**
 * Color
 */
extension Color {
   /**
    * A color object with a grayscale value of 1/3 and an alpha value of 1.0.
    * - Note: ref: https://developer.apple.com/documentation/uikit/uicolor/1621952-darkgray
    * - Note: We can't manipulate hybrid color types with lighter darker methods. Adjustments needs to be done pre-hybrid init
    * - Fixme: ⚠️️ add rgb hue for dark and light
    */
   public static var darkGray: Color {
      .init( // Creates a Color instance representing a dark gray color that adapts to light and dark appearance settings.
         light: .init(nsColor: NSColor.darkGray), // The color for light mode is dark gray.
         dark: .init(nsColor: NSColor.darkGray) // The color for dark mode is also dark gray, maintaining the same appearance in both modes.
      )
   }
   /**
    * A color object with the same color space and component values as the NSColor light gray color.
    * - Description: This color is designed to work well in a variety of lighting situations, making it a versatile choice for UI elements that require a neutral, light appearance.
    */
   public static var lightGray: Color {
      // - Fixme: ⚠️️ look into: NSLightGray? or ask copilot?
      .init(NSColor._lightGray)
   }
   /**
    * A color object that represents the system gray color in macOS.
    * - Description: This color adapts to the current appearance settings, providing a neutral gray that works well in both light and dark modes.
    */
   public static var systemGray: Color {
      .init(NSColor.systemGray)
   }
   /**
    * A color object that represents the second-level system gray color in macOS.
    * - Description: This color adapts to light and dark appearance settings, offering a slightly lighter shade of gray in light mode and a darker shade in dark mode.
    */
   public static var systemGray2: Color {
      .init(
         light: .init(nsColor: NSColor.systemGray2.light),
         dark: .init(nsColor: NSColor.systemGray2.dark)
      )
   }
   /**
    * A color object that represents the third-level system gray color in macOS.
    * - Description: This color provides a mid-level gray that adapts to light and dark appearance settings, suitable for secondary UI elements that require differentiation.
    */
   public static var systemGray3: Color {
      .init(
         light: .init(nsColor: NSColor.systemGray3.light),
         dark: .init(nsColor: NSColor.systemGray3.dark)
      )
   }
   /**
    * A color object that represents the fourth-level system gray color in macOS.
    * - Description: This adaptive color offers a lighter gray in light mode and a significantly darker gray in dark mode, ideal for providing contrast in layered interfaces.
    */
   public static var systemGray4: Color {
      .init(
         light: .init(nsColor: NSColor.systemGray4.light),
         dark: .init(nsColor: NSColor.systemGray4.dark)
      )
   }
   /**
    * A color object that represents the fifth-level system gray color in macOS.
    * - Description: This color adjusts between a very light gray in light mode and a darker gray in dark mode, perfect for subtle UI accents that require less prominence.
    */
   public static var systemGray5: Color {
      .init(
         light: .init(nsColor: NSColor.systemGray5.light),
         dark: .init(nsColor: NSColor.systemGray5.dark)
      )
   }
   /**
    * A color object that represents the sixth-level system gray color in macOS.
    * - Description: This color provides the lightest gray in light mode and the darkest gray in dark mode within the system gray series, ensuring maximum contrast for the most subtle UI elements.
    */
   public static var systemGray6: Color {
      .init(
         light: .init(nsColor: NSColor.systemGray6.light),
         dark: .init(nsColor: NSColor.systemGray6.dark)
      )
   }
}
#endif
