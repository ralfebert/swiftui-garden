// » SwiftUI Garden
// » https://swiftui-garden.com/Animations/Controlled-Animations
// » https://github.com/ralfebert/swiftui-garden/blob/main/Animations/KeyframeAnimatorExample.swift

import SwiftUI

struct KeyframeAnimatorExample: View {
    @State private var trigger = false

    struct AnimationValues {
        var scale = 1.0
        var rotation = Angle.zero
        var yOffset = 0.0
    }

    var body: some View {
        VStack {
            Image(systemName: "star.fill")
                .font(.system(size: 50))
                .foregroundStyle(.orange)
                .keyframeAnimator(
                    initialValue: AnimationValues(),
                    trigger: trigger,
                    content: { content, value in
                        content
                            .scaleEffect(value.scale)
                            .rotationEffect(value.rotation)
                            .offset(y: value.yOffset)
                    },
                    keyframes: { _ in
                        KeyframeTrack(\.scale) {
                            LinearKeyframe(1.5, duration: 0.2)
                            SpringKeyframe(0.8, spring: .bouncy)
                            CubicKeyframe(1.2, duration: 0.3)
                            LinearKeyframe(1.0, duration: 0.2)
                        }

                        KeyframeTrack(\.rotation) {
                            LinearKeyframe(.degrees(45), duration: 0.3)
                            CubicKeyframe(.degrees(-30), duration: 0.4)
                            SpringKeyframe(.degrees(360), spring: .snappy)
                        }

                        KeyframeTrack(\.yOffset) {
                            LinearKeyframe(-30, duration: 0.2)
                            SpringKeyframe(20, spring: .bouncy(duration: 0.4))
                            CubicKeyframe(-10, duration: 0.2)
                            LinearKeyframe(0, duration: 0.3)
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
    KeyframeAnimatorExample()
}
