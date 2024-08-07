import SwiftUI
#if os(iOS)
import UIKit
/**
 * - Description: This extension provides UIColor compatibility for Color by adding static variables that represent various shades of system grays, which are adaptable to different appearances in iOS.
 */
extension Color {
    /**
     A color object with the same color space and component values as the UIKit dark gray color.
     */
    public static var darkGray: Color {
        return .init(uiColor: .darkGray)
    }
    /**
     A color object with the same color space and component values as the UIKit light gray color.
     */
    public static var lightGray: Color {
        return .init(uiColor: .lightGray)
    }
    /**
     A color object that represents the system gray color.
     */
    public static var systemGray: Color {
        return .init(uiColor: .systemGray)
    }
    /**
     A color object that represents the second-level system gray color.
     */
    public static var systemGray2: Color {
        return .init(uiColor: .systemGray2)
    }
    /**
     A color object that represents the third-level system gray color.
     */
    public static var systemGray3: Color {
        return .init(uiColor: .systemGray3)
    }
    /**
     A color object that represents the fourth-level system gray color.
     */
    public static var systemGray4: Color {
        return .init(uiColor: .systemGray4)
    }
    /**
     A color object that represents the fifth-level system gray color.
     */
    public static var systemGray5: Color {
        return .init(uiColor: .systemGray5)
    }
    /**
     A color object that represents the sixth-level system gray color.
     */
    public static var systemGray6: Color {
        return .init(uiColor: .systemGray6)
    }
}
#endif
