import SwiftUI
/**
 * - Description: This extension provides a way to define dynamic colors that adapt to both light and dark modes in SwiftUI.
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
    * - Fixme: ⚠️️ refactor to `Color(nsColor: NSColor(name: nil) { appearance in` for macOS and `Color(uiColor: UIColor { traitCollection in` for iOS
    * - Fixme: ⚠️️ add type to apperance and traitCollection?
    * ## Examples:
    * let color: Color = .init(light: .black, dark: .white)
    * - Parameters:
    *   - light: The color to be used in light mode.
    *   - dark: The color to be used in dark mode.
    */
   public init(light: Color, dark: Color) {
      #if os(macOS)
      // Creates a named NSColor that dynamically provides the appropriate color based on the current appearance context.
      self = Color(nsColor: NSColor(name: "DynamicColor", dynamicProvider: { appearance in
         // Determines if the current appearance context matches the dark mode (darkAqua) and returns the corresponding color.
         if appearance.bestMatch(from: [.darkAqua, .aqua]) == .darkAqua {
            return NSColor(dark) // Return the color for dark mode
         } else {
            return NSColor(light) // Return the color for light mode
         }
      }))
      #else
      if #available(iOS 13.0, *) {
         self = Color(uiColor: UIColor(dynamicProvider: { traitCollection in // fix: doc this line
            traitCollection.userInterfaceStyle == .dark ? UIColor(dark) : UIColor(light) // fix: doc this line
         }))
      } else {
         self = Color(light) // fix: doc this line
      }
      #endif
   }
}
/**
 * Convenience
 * - Description: This extension provides additional convenience properties for `Color` to easily access common color schemes and system colors, enhancing the adaptability of UI components across different platforms and themes.
 * - Note: Extensive color multiplatform lib: https://github.com/diniska/swiftui-system-colors/blob/void/Sources/SystemColors/SystemColors.swift
 * - Note: theme idea: https://stackoverflow.com/a/72235961/5389500
 * - Note: ref: https://stackoverflow.com/a/62207329/5389500
 * - Fixme: ⚠️️ Add from here: https://github.com/onmyway133/EasySwiftUI/blob/master/Sources/EasySwiftUI/Extensions/Color.swift
 * - Fixme: ⚠️️ Add more color switching and darkmode / lightmode code for different platforms here: https://onmyway133.com/posts/how-to-use-dynamic-color-in-ios/
 */
extension Color {
   /**
    * Useful for dark and light mode
    * - Description: Provides a color that is white in light mode and black in dark mode, useful for background elements that need to adapt to the current UI theme.
    * - Fixme: ⚠️️ Rename to whiteAndBlack? or instead `wb`? and `bw`? that would avoid name colision with current implementation code etc
    */
   public static let blackOrWhite: Color = {
      .init(light: .white, dark: .black)
   }()
   /**
    * Useful for dark and light mode
    * - Description: Provides a color that is black in light mode and white in dark mode, useful for foreground text or UI elements that need to contrast with their background.
    * - Fixme: ⚠️️ Rename to blackOrWhite? or instead `bw``, that would avoid name colision with current implementation code etc
    */
   public static let whiteOrBlack: Color = {
      .init(light: .black, dark: .white)
   }()
   /**
    * Use background color variants to indicate hierarchy
    * - Description: Use background color variants to indicate hierarchy in the user interface.
    * - Primary: For the overall view
    * - Secondary: For grouping content within the overall view
    * - Tertiary: For grouping content within secondary elements
    */
   #if os(macOS)
   /**
    * The color for the window's background. Typically used for the main background of your app's windows.
    */
   public static let background: Color = .init(NSColor.windowBackgroundColor)
   /**
    * The color for content layered on top of the main background. Use this color to fill the background of any content that is layered on top of the window's background.
    */
   public static let secondaryBackground: Color = .init(NSColor.underPageBackgroundColor)
   /**
    * The color for the background of large interface elements, such as scroll views, table views, and collection views. This color is appropriate for designs that have a layered interface with a depth effect.
    */
   public static let tertiaryBackground: Color = .init(NSColor.controlBackgroundColor)
   #else
   /**
    * The color for the main background of an interface. It adapts to the current trait environment.
    */
   public static let background: Color = .init(UIColor.systemBackground)
   /**
    * The color for content layered on top of the main background. It adapts to the current trait environment.
    */
   public static let secondaryBackground: Color = .init(UIColor.secondarySystemBackground)
   /**
    * The color for the background of smaller interface elements, such as table view cells and text fields. It adapts to the current trait environment.
    */
   public static let tertiaryBackground: Color = .init(UIColor.tertiarySystemBackground)
   #endif
}

