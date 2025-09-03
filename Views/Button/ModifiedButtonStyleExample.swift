// » SwiftUI Garden
// » https://swiftui-garden.com/Views/Button/Custom-Button-Styles

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
