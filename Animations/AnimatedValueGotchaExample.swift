// » SwiftUI Garden
// » https://swiftui-garden.com/Animations/Animating-value-changes

import SwiftUI

struct AnimatedValueGotchaExample: View {
    @State var isLeftLarge = false
    @State var isRightLarge = false

    var body: some View {
        VStack {
            HStack {
                Color.blue
                    .frame(width: 120, height: 120)
                    .scaleEffect(isLeftLarge ? 1.0 : 0.5)

                Color.blue
                    .frame(width: 120, height: 120)
                    .scaleEffect(isRightLarge ? 1.0 : 0.5)
            }
            .frame(width: 180, height: 180)

            Button("Animate", systemImage: "play.fill") {
                self.isLeftLarge.toggle()
                self.isRightLarge.toggle()
            }
            .buttonStyle(.borderedProminent)
        }
        // Gotcha: this will also animate the change triggered by
        // isRightLarge as the change happens in the same View update
        .animation(.default, value: isLeftLarge)
    }
}

#Preview {
    AnimatedValueGotchaExample()
}
