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
                        .transition(.rotate3D)
                }
            }
            .frame(height: 200)
            .animation(.spring, value: showCard)
        }
        .padding()
    }
}

extension AnyTransition {
    static var rotate3D: AnyTransition {
        .modifier(
            active: Rotate3DTransition(progress: 0),
            identity: Rotate3DTransition(progress: 1)
        )
    }
}

struct Rotate3DTransition: ViewModifier {
    let progress: Double

    func body(content: Content) -> some View {
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

#Preview {
    CustomTransitionExample()
}
