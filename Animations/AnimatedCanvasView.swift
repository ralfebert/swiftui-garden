// » SwiftUI Garden
// » https://swiftui-garden.com/Animations/Animation-playground

import SwiftUI

struct AnimatedCanvasView: View {
    @State private var trigger = false

    var body: some View {

        KeyframeAnimator(
            initialValue: Color.blue,
            trigger: trigger,
            content: { color in
                Canvas { context, _ in
                    context.fill(
                        Path(ellipseIn: CGRect(x: 50, y: 50, width: 100, height: 100)),
                        with: .color(color)
                    )
                }
            },
            keyframes: { _ in
                KeyframeTrack(\.self) {
                    LinearKeyframe(Color.red, duration: 1.0)
                    LinearKeyframe(Color.green, duration: 1.0)
                    LinearKeyframe(Color.blue, duration: 1.0)
                }
            }
        )
        .onTapGesture {
            trigger.toggle()
        }
    }
}

extension Color: @retroactive Animatable {
    public var animatableData: AnimatableValues<CGFloat, CGFloat, CGFloat, CGFloat> {
        get {
            let uiColor = UIColor(self)
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            var alpha: CGFloat = 0

            uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

            return AnimatableValues(red, green, blue, alpha)
        }
        set {
            self = Color(
                red: newValue.value.0,
                green: newValue.value.1,
                blue: newValue.value.2,
                opacity: newValue.value.3
            )
        }
    }
}

#Preview {
    AnimatedCanvasView()
}
