// » SwiftUI Garden
// » https://swiftui-garden.com/Animations/View-Transitions

import SwiftUI

struct CustomTransitionExample: View {
    @State private var showCard = false

    var body: some View {
        VStack {
            Button("Toggle Card") {
                showCard.toggle()
            }

            ZStack {
                if showCard {
                    RotationSparklesCard()
                        .transition(Rotate3DTransition())
                }
            }
            .frame(height: 200)
            .animation(.spring, value: showCard)
        }
    }
}

struct Rotate3DTransition: Transition {
    func body(content: Content, phase: TransitionPhase) -> some View {
        let progress = phase.isIdentity ? 1.0 : 0.0
        content
            .scaleEffect(progress)
            .opacity(progress)
            .blur(radius: (1 - progress) * 10)
            .rotation3DEffect(
                .degrees((1 - progress) * 180),
                axis: (x: 1, y: 0, z: 0),
                anchor: .center,
                perspective: 0.5
            )
    }
}

struct RotationSparklesCard: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(
                LinearGradient(
                    colors: [.purple, .indigo],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .frame(width: 250, height: 150)
            .overlay(
                VStack {
                    Image(systemName: "sparkles")
                        .font(.largeTitle)
                    Text(".rotate3D transition")
                        .font(.headline)
                }
                .foregroundColor(.white)
            )
    }
}

#Preview {
    CustomTransitionExample()
}
