import SwiftUI
/**
 * - Note: More comprehensive: https://stackoverflow.com/a/77707499/5389500
 * - Note: and tut: https://www.jessesquires.com/blog/2023/07/11/creating-dynamic-colors-in-swiftui/
 * - Fixme: ⚠️️ Add support for this for UIColor aswell? there isnt direct support right now, but there exist workarounds, write about these etc
 * ## Examples:
 * let color = Color(light: .blue, dark: green)
 */
extension Color {
   /**
    * This method provides a way to define color sets for both light and dark mode.
    * - Description: It returns a dynamic color that automatically adjusts to the current interface style.
    * - Note: Works for iOS and macOS
    * - Fixme: ⚠️️ add type to apperance and traitCollection
    * ## Examples:
    * let dynamicColor = Color(light: .black, dark: .white)
    * - Parameters:
    *   - light: The color to be used in light mode.
    *   - dark: The color to be used in dark mode.
    */
   public init(light: Color, dark: Color) {
      #if os(macOS)
      self = Color(nsColor: NSColor(name: "DynamicColor", dynamicProvider: { appearance in
         if appearance.bestMatch(from: [.darkAqua, .aqua]) == .darkAqua {
            return NSColor(dark) // Return the color for dark mode
         } else {
            return NSColor(light) // Return the color for light mode
         }
      }))
      #else
      if #available(iOS 13.0, *) {
         self = Color(uiColor: UIColor(dynamicProvider: { traitCollection in
            traitCollection.userInterfaceStyle == .dark ? UIColor(dark) : UIColor(light)
         }))
      } else {
         self = Color(light)
      }
      #endif
   }
}
/**
 * Convenience
 * - Note: Extensive color multiplatform lib: https://github.com/diniska/swiftui-system-colors/blob/void/Sources/SystemColors/SystemColors.swift
 * - Note: theme idea: https://stackoverflow.com/a/72235961/5389500
 * - Note: ref: https://stackoverflow.com/a/62207329/5389500
 * - Fixme: ⚠️️ Add from here: https://github.com/onmyway133/EasySwiftUI/blob/master/Sources/EasySwiftUI/Extensions/Color.swift
 * - Fixme: ⚠️️ Add more color switching and darkmode / lightmode code for different platforms here: https://onmyway133.com/posts/how-to-use-dynamic-color-in-ios/
 */
extension Color {
   /**
    * Useful for dark and light mode
    * - Fixme: ⚠️️ Rename to whiteAndBlack? or instead wb? and bw? that would avoid name colision with current implementation code etc
    */
   public static let blackOrWhite: Color = {
      Color.init(light: .white, dark: .black)
   }()
   /**
    * Useful for dark and light mode
    * - Fixme: ⚠️️ Rename to blackOrWhite? or instead bw, that would avoid name colision with current implementation code etc
    */
   public static let whiteOrBlack: Color = {
      Color(light: .black, dark: .white)
   }()
   /**
    * Use background color variants to indicate hierarchy
    * - Primary: For the overall view
    * - Secondary: For grouping content within the overall view
    * - Tertiary: For grouping content within secondary elements
    */
   #if os(macOS)
   public static let background: Color = .init(NSColor.windowBackgroundColor)
   public static let secondaryBackground: Color = .init(NSColor.underPageBackgroundColor)
   public static let tertiaryBackground: Color = .init(NSColor.controlBackgroundColor)
   #else
   public static let background = Color(UIColor.systemBackground)
   public static let secondaryBackground = Color(UIColor.secondarySystemBackground)
   public static let tertiaryBackground = Color(UIColor.tertiarySystemBackground)
   #endif
}
//extension Color {
//   static func dynamicColor(light: UIColor, dark: UIColor) -> Color {
//
//}
//extension Color {
//   // ref: https://stackoverflow.com/a/65200509/5389500
//   static var primaryColor: Color {
//      Color(UIColor { $0.userInterfaceStyle == .dark ? UIColor(red: 255, green: 255, blue: 255, alpha: 1) : UIColor(red: 200, green: 200, blue: 200, alpha: 1) })
//   }
//
//}
// self = Color(nsColor: NSColor(name: "DynamicColor")!)
