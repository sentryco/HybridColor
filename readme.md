[![Tests](https://github.com/sentryco/HybridColor/actions/workflows/Tests.yml/badge.svg)](https://github.com/sentryco/HybridColor/actions/workflows/Tests.yml)
[![codebeat badge](https://codebeat.co/badges/127fa394-9f2f-4910-ae8a-d9ddf5638e62)](https://codebeat.co/projects/github-com-sentryco-hybridcolor-main)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Swift Version](https://img.shields.io/badge/Swift-5.9-orange.svg)](https://swift.org)

# 🌓 HybridColor

HybridColor is a Swift library designed for both macOS and iOS. It offers a seamless way to create SwiftUI colors that adapt to light and dark modes, enhancing the user interface experience across different environments.

## Requirements

- macOS v14 and later
- iOS 17 and later
- Swift 5.9 and later

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/sentryco/HybridColor.git", branch: "main")
]
```

## Usage

```swift
import SwiftUI
import HybridColor

#Preview {
    struct ContentView: View {
        var body: some View {
            Text("Hello, world!")
                .foregroundColor(.whiteOrBlack) // white in dark-mode, black in light-mode
                .padding()
                .background(.init(light: .white, dark: .black))
        }
    }
    return Group {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

[MIT](https://choosealicense.com/licenses/mit/)

## Todo: 
- Add systemGreen, systemPink, etc
- Improvement
Provide clear and actionable error messages, possibly using assertionFailure for debugging purposes.
```swift
guard let cgColor = self.cgColor else {
    assertionFailure("Failed to retrieve cgColor from Color.")
    return self
}
```
- Improvement
Add more color manipulation methods, such as adjusting saturation, hue, or creating complementary colors.
```swift
public func adjustedSaturation(by amount: CGFloat) -> Color {
    // Implementation
}
```