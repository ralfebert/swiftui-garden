// » SwiftUI Garden
// » https://swiftui-garden.com/Animations/Animation-playground

import SwiftUI

struct RotatingPhaseAnimatorExample: View {

    var body: some View {

        Image(systemName: "arrow.up")
            .font(.system(size: 60, weight: .semibold))
            .phaseAnimator(
                [0, 360],
                content: { view, value in
                    view.rotationEffect(Angle(degrees: value))
                },
                animation: { phase in
                    .linear(duration: 1).repeatForever(autoreverses: false)
                }
            )

    }
}

#Preview {
    RotatingPhaseAnimatorExample()
}
