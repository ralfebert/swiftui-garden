// » SwiftUI Garden
// » https://swiftui-garden.com/Animations/Animating-value-changes
// » https://github.com/ralfebert/swiftui-garden/blob/main/Animations/AnimatedValueContentBlockExample.swift

import SwiftUI

struct AnimatedValueContentBlockExample: View {
    @State var isLarge = false

    var body: some View {
        VStack {
            HStack {
                Rectangle()
                    .foregroundColor(Color.red)
                    .frame(width: 150, height: 150)
                    .clipShape(.rect(cornerRadius: 30))
                    .animation(.default) { content in
                        content
                            .scaleEffect(isLarge ? 1.0 : 0.4)
                    }
            }
            .frame(width: 180, height: 180)

            Button("Animate", systemImage: "play.fill") {
                self.isLarge.toggle()
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    AnimatedValueContentBlockExample()
}
