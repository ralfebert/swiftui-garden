// » SwiftUI Garden
// » https://swiftui-garden.com/Animations/Controlled-Animations

import SwiftUI

struct PhaseAnimatorExample: View {
    @State private var trigger = false

    enum Phase: CaseIterable {
        case small, large
    }

    var body: some View {
        VStack {
            Image(systemName: "star.fill")
                .font(.system(size: 50))
                .phaseAnimator(
                    [Phase.small, .large],
                    trigger: trigger,
                    content: { content, phase in

                        let color = switch phase {
                        case .small: Color.blue
                        case .large: Color.orange
                        }

                        let scale = switch phase {
                        case .small: 0.5
                        case .large: 1.2
                        }

                        let yOffset = switch phase {
                        case .small: 0.0
                        case .large: -40.0
                        }

                        content
                            .foregroundStyle(color)
                            .scaleEffect(scale)
                            .offset(y: yOffset)
                    },
                    animation: { phase in
                        switch phase {
                        case .small: .easeIn(duration: 0.2)
                        case .large: .spring(duration: 0.5, bounce: 0.4)
                        }
                    }
                )
                .frame(height: 150)

            Button("Animate", systemImage: "play.fill") {
                trigger.toggle()
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    PhaseAnimatorExample()
}
