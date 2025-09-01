// » SwiftUI Garden
// » https://swiftui-garden.com/Animations/Animating-value-changes
// » https://github.com/ralfebert/swiftui-garden/blob/main/Animations/WithAnimationExample.swift

import SwiftUI

struct WithAnimationExample: View {
    @State var isLarge = false

    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 150, height: 150)
                    .clipShape(.rect(cornerRadius: 30))
                    .scaleEffect(isLarge ? 1.0 : 0.4)
            }
            .frame(width: 180, height: 180)

            Button("Animate", systemImage: "play.fill") {
                withAnimation(.default) {
                    self.isLarge.toggle()
                }
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    WithAnimationExample()
}
