<a href="https://github.com/ralfebert/swiftui-garden/edit/main/Views/Button/Custom%20Button%20Styles.md"><em>edit ✏️</em></a>

A `ButtonStyle` is a reusable definition of the look and feel of a custom button. It's passed a configuration with the button label and returns the View for the button:

![[customButtonStyle.1.png|300]]

```swift
// » SwiftUI Garden
// » https://swiftui-garden.com/Views/Button/Custom+Button+Styles
// » https://github.com/ralfebert/swiftui-garden/blob/main/Views/Button/CustomButtonStyleView.swift

import SwiftUI

struct FunkyButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [.blue, .purple]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .foregroundColor(.white)
            .clipShape(.rect(cornerRadius: 20))
            .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
            .animation(.bouncy, value: configuration.isPressed)
    }
}

extension ButtonStyle where Self == FunkyButtonStyle {
    static var funky: FunkyButtonStyle {
        FunkyButtonStyle()
    }
}

struct CustomButtonStyleView: View {
    var body: some View {
        Button("Roll", systemImage: "dice") {}
            .buttonStyle(.funky)
    }
}

#Preview {
    CustomButtonStyleView()
}
```

## Button Styles with custom gestures

`PrimitiveButtonStyle` is even more customizable and allows to define the interaction behaviour / gestures for the button from scratch. [Example](https://www.avanderlee.com/swiftui/swiftui-button-styles/#defining-both-a-custom-button-style-and-interaction)

## Modifying existing button styles

The system-defined [[Button Styles]] can be extended by forwarding the implementation to their `.makeBody()` method:

![[modifiedButtonStyle.1.png|300]]

```swift
// » SwiftUI Garden
// » https://swiftui-garden.com/Views/Button/Custom+Button+Styles
// » https://github.com/ralfebert/swiftui-garden/blob/main/Views/Button/ModifiedButtonStyleExample.swift

import SwiftUI

struct TypewriterButtonStyle: PrimitiveButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        BorderedProminentButtonStyle()
            .makeBody(configuration: configuration)
            .font(.body.monospaced().bold())
            .tint(Color.gray)
    }
}

extension PrimitiveButtonStyle where Self == TypewriterButtonStyle {
    static var typewriter: TypewriterButtonStyle {
        TypewriterButtonStyle()
    }
}

struct ModifiedButtonStyleExample: View {
    var body: some View {
        Button("Roll", systemImage: "dice") {}
            .buttonStyle(.typewriter)
    }
}

#Preview {
    ModifiedButtonStyleExample()
}
```
