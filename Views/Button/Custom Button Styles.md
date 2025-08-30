A button style, built from scratch around the Button Label using modifiers, can be defined and then re-used throughout many Views by defining it as `ButtonStyle`:

![[customButtonStyle.1.png|300]]

```swift
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
        Button("roll", systemImage: "dice") {}
            .buttonStyle(.funky)
    }
}
```

## Button Styles with custom gestures

The interaction behaviour / gestures for the button can also be defined from scratch and then made available as a `PrimitiveButtonStyle`([Example: ](https://www.avanderlee.com/swiftui/swiftui-button-styles/#defining-both-a-custom-button-style-and-interaction))

## Modifying existing button styles

The system-defined [[Button Styles]] can be extended by forwarding the implementation to their `.makeBody()` method:

![[modifiedButtonStyle.1.png|300]]

```swift
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
        Button("roll", systemImage: "dice") {}
            .buttonStyle(.typewriter)
    }
}
```
