import Foundation
import QuartzCore
import SwiftUI
#if os(iOS)
import UIKit
/// OSColor is a typealias for UIColor on iOS platforms
/// This allows for consistent color handling across iOS and macOS
public typealias OSColor = UIColor
#elseif os(macOS)
import Cocoa
/// OSColor is a typealias for NSColor on macOS platforms
/// This allows for consistent color handling across iOS and macOS
public typealias OSColor = NSColor
#endif
/**
 * SwiftUI support for color tweaking
 * - Description: This extension provides methods to adjust the lightness of a Color instance.
 * - Fixme: ⚠️️ Split this file into multiple files etc, check legacy for similar code, docs etc
 * - Fixme: ⚠️️ Move this to HybridColor 👈 Yes, probably!
 */
extension Color {
   /**
    * lighter
    * - Description: This method lightens the color by a specified amount. The amount is a CGFloat that ranges from 0 to 1, where 0 is the original color and 1 is white.
    * - Fixme: ⚠️️ For some reason Color.blue crashes, so use Color(uiColor: .systemBlue)
    * - Parameter amount: The amount to lighten the color, ranging from 0 to 1.
    * - Returns: A new Color instance that is lighter than the original by the specified amount.
    */
   public func lighter(amount: CGFloat = 0.25) -> Color {
      #if os(iOS)
      // - Fixme: ⚠️️ don't use forced unwrap. find better solution later
      guard let cgColor = self.cgColor else { Swift.print("⚠️️ UNABLE TO UNWRAP CGCOLOR, no light adjustment made, return without adjustment ⚠️️"); return self }
      let uiColor: UIColor = .init(cgColor: cgColor)
      let adjustedColor = uiColor.lighter(amount: amount)
      return .init(uiColor: adjustedColor)
      #elseif os(macOS)
      // - Fixme: ⚠️️ don't use forced unwrap. find better solution later
      guard let cgColor = self.cgColor else { Swift.print("⚠️️ UNABLE TO UNWRAP CGCOLOR, no light adjustment made, return without adjustment ⚠️️"); return self }
      guard let nsColor = NSColor(cgColor: cgColor) else { Swift.print("⚠️️ UANBLE TO UNWRAP NSCOLOR, no light adjustment made, return without adjustment ⚠️️"); return self }
      let adjustedColor = nsColor.lighter(amount: amount)
      return .init(nsColor: adjustedColor)
      #endif
   }
   /**
    * darker
    * - Description: This method darkens the color by a specified amount. The amount is a CGFloat that ranges from 0 to 1, where 0 is the original color and 1 is black.
    * - Fixme: ⚠️️ for some reason Color.blue crashes, so use Color(uiColor: .systemBlue)
    * - Fixme: ⚠️️ get rid of the forced unwraps
    * - Parameter amount: The amount to darken the color, ranging from 0 to 1.
    * - Returns: A new Color instance that is darker than the original by the specified amount.
    */
   public func darker(amount: CGFloat = 0.25) -> Color {
      #if os(iOS)
      // - Fixme: ⚠️️ don't use forced unwrap. find better solution later
      guard let cgColor = self.cgColor else { Swift.print("⚠️️ UNABLE TO UNWRAP CGCOLOR, no dark adjustment made, return without adjustment ⚠️️"); return self }
      let uiColor: UIColor = .init(cgColor: cgColor)
      let adjustedColor = uiColor.darker(amount: amount)
      return .init(uiColor: adjustedColor)
      #elseif os(macOS)
      // - Fixme: ⚠️️ don't use forced unwrap. find better solution later
      guard let cgColor = self.cgColor else { Swift.print("⚠️️ UNABLE TO UNWRAP CGCOLOR, no dark adjustment made, return without adjustment ⚠️️"); return self }
      guard let nsColor = NSColor(cgColor: cgColor) else { Swift.print("⚠️️ UNABLE TO UNWRAP NSCOLOR, no dark adjustment made, return without adjustment ⚠️️"); return self }
      let adjustedColor = nsColor.darker(amount: amount)
      return .init(nsColor: adjustedColor)
      #endif
   }
}
/**
 * Makes color lighter or darker
 * - Description: This extension provides methods to adjust the brightness of a color. It includes methods to make a color lighter or darker by a specified amount.
 * - Note: Adjust colors: https://stackoverflow.com/questions/38435308/get-lighter-and-darker-color-variations-for-a-given-uicolor
 * ## Examples:
 * let color = UIColor(red: 0.5, green: 0.8, blue: 0.8, alpha: 1.0)
 * color.lighter(amount:0.5)
 * color.darker(amount:0.5)
 * OR (with the default values):
 * color.lighter()
 * color.darker()
 */
extension OSColor {
   /**
    * Lighter
    * - Description: This method lightens the color by a specified amount. The amount is a CGFloat that ranges from 0 to 1, where 0 is the original color and 1 is white.
    * - Parameter amount: 0 - 1
    * - Returns: color
    */
   public func lighter(amount: CGFloat = 0.25) -> OSColor {
      adjust(amount: 1 + amount) // Call the "adjust" method on the current color with an adjusted amount
   }
   /**
    * Darker
    * - Description: This method darkens the color by a specified amount. The amount is a CGFloat that ranges from 0 to 1, where 0 is the original color and 1 is black.
    * - Parameter amount: 0 - 1
    * - Returns: color
    */
   public func darker(amount: CGFloat = 0.25) -> OSColor {
      adjust(amount: 1 - amount) // Call the "adjust" method on the current color with an adjusted amount
   }
   /**
    * - Description: This property resolves the color space of the current color. On macOS, it converts the color to the generic RGB color space. On iOS, it returns the color as is.
    * - Remark: Quick fix for macOS issue
    */
   public var resolvedColorSpace: OSColor {
      #if os(macOS)
      return self.usingColorSpace(.genericRGB)! // Convert the color to the generic RGB color space on macOS
      #elseif os(iOS)
      return self // Return the color as is on iOS
      #endif
   }
}
/**
 * Private helper
 */
extension OSColor {
   /**
    * Adjust
    * - Description: This method adjusts the brightness of the color by a specified amount. The amount is a CGFloat that ranges from 0 to 1, where 0 is the original color and 1 is either black or white depending on whether the color is being darkened or lightened.
    * - Remark: Using system colors on macOS causes issues when using lighter, darker etc. So we need to resolve the colorspace first
    * - Parameter amount: 0 - 1
    * - Returns: color
    */
   fileprivate func adjust(amount: CGFloat) -> OSColor {
      var hue: CGFloat = 0 // Declare a variable named "hue" of type CGFloat and initialize it to 0
      var saturation: CGFloat = 0 // Declare a variable named "saturation" of type CGFloat and initialize it to 0
      var brightness: CGFloat = 0 // Declare a variable named "brightness" of type CGFloat and initialize it to 0
      var alpha: CGFloat = 0 // Declare a variable named "alpha" of type CGFloat and initialize it to 0
      #if os(iOS) // things work differently in iOS
      if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
         return OSColor(hue: hue, // Create a new color with the same hue
                      saturation: saturation, // Create a new color with the same saturation
                      brightness: brightness * amount, // Create a new color with adjusted brightness
                      alpha: alpha ) // Create a new color with the same alpha
      } else {
         return self
      }
      #else // Covers macOS
      let color: OSColor = self.resolvedColorSpace
      color.getHue(&hue, // Get the hue value of the color
                   saturation: &saturation, // Get the saturation value of the color
                   brightness: &brightness, // Get the brightness value of the color
                   alpha: &alpha) // Get the alpha value of the color
      return OSColor(hue: hue, // Create a new color with the same hue
                   saturation: saturation, // Create a new color with the same saturation
                   brightness: brightness * amount, // Create a new color with adjusted brightness
                   alpha: alpha ) // Create a new color with the same alpha
      #endif
   }
}
/**
 * - Description: This extension provides additional functionality for the OSColor type, including methods for adjusting brightness and blending colors.
 */
extension OSColor {
   #if os(macOS)
   /**
    * - Remark: non optional blended
    * - Description: This method blends the current color with a specified color in a given proportion. The fraction parameter determines the proportion of the specified color in the resulting blend. A fraction of 0 will result in the original color, while a fraction of 1 will result in the specified color.
    * - Parameters:
    *   - fraction: The fraction of the current color to blend with the specified color.
    *   - color: The color to blend with the current color.
    * - Returns: The blended color.
    */
   public func blended(fraction: CGFloat, color: OSColor) -> OSColor {
      self.blended(withFraction: fraction, of: color) ?? self // Blend the current color with the specified color using the specified fraction, or return the current color if the blending fails
   }
   // - Fixme: ⚠️️ make for swiftui
   #endif
}
/**
 * Color
 */
extension Color {
   /**
    * lighter
    * - Description: This method lightens the current color by a specified fraction. The fraction parameter determines the degree of lightening applied to the color. A fraction of 0 will result in the original color, while a fraction of 1 will result in a fully white color.
    * - Parameters:
    *   - fraction: The fraction of the current color to blend with the specified color.
    *   - color: The color to blend with the current color.
    * - Returns: The blended color.
    */
   #if os(macOS)
   public func blended(fraction: CGFloat, color: Color) -> Color {
      // - Fixme: ⚠️️ don't use forced unwrap. find better solution later
      let nsColor = NSColor(cgColor: self.cgColor!)!
      let nsColor2 = NSColor(cgColor: color.cgColor!)!
      let adjustedColor = nsColor.blended(fraction: fraction, color: nsColor2)
      return .init(nsColor: adjustedColor)
   }
   #endif
}
// not needed, just do .init(.systemBlue ec)
//extension Color {
//   #if os(iOS)
//   func color(osColor: UIColor) -> Color {
//      return .init(uiColor: osColor)
//   }
//   #elseif os(macOS)
//   func color(osColor: NSColor) -> Color {
//      return .init(nsColor: osColor)
//   }
//   #endif
//}
