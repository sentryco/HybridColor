[![Tests](https://github.com/sentryco/HybridColor/actions/workflows/Tests.yml/badge.svg)](https://github.com/sentryco/HybridColor/actions/workflows/Tests.yml)

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
