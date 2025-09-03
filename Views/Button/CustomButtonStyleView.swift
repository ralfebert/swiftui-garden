// » SwiftUI Garden
// » https://swiftui-garden.com/Views/Button/Custom-Button-Styles

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
