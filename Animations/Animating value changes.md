<a href="https://github.com/ralfebert/swiftui-garden/edit/main/Animations/Animating%20value%20changes.md"><em>edit ✏️</em></a>

When a value changes that a View depends on, there are three different approaches to animate the change:

a) Wrap the value change in a `withAnimation {}` block:

![[AnimatedValueExample.mp4]]

```swift
// » SwiftUI Garden
// » https://swiftui-garden.com/Animations/Animating+value+changes
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
```

b) Use the `.animation()` modifier to trigger an animation when the value changes:

```swift
// » SwiftUI Garden
// » https://swiftui-garden.com/Animations/Animating+value+changes
// » https://github.com/ralfebert/swiftui-garden/blob/main/Animations/AnimatedValueExample.swift

import SwiftUI

struct AnimatedValueExample: View {
    @State var isLarge = false

    var body: some View {
        VStack {
            HStack {
                Rectangle()
                    .foregroundColor(Color.red)
                    .frame(width: 150, height: 150)
                    .clipShape(.rect(cornerRadius: 30))
                    .scaleEffect(isLarge ? 1.0 : 0.4)
                    .animation(.default, value: isLarge)
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
    AnimatedValueExample()
}
```

This comes with a gotcha: The animation modifier will apply the animation to all value changes that happen in the same "view update cycle" inside the View that is modified by `.animation()`. When other values change at the same time, these will be animated as well:

![[AnimatedValueGotchaExample.mp4]]

```swift
// » SwiftUI Garden
// » https://swiftui-garden.com/Animations/Animating+value+changes
// » https://github.com/ralfebert/swiftui-garden/blob/main/Animations/AnimatedValueGotchaExample.swift

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
        // Gotcha: this will also animate the change triggered by isRightLarge as the change happens in the same View update
        .animation(.default, value: isLeftLarge)
    }
}

#Preview {
    AnimatedValueGotchaExample()
}
```

c) Apply the animated view modifiers selectively using `.animation` with a view content block (this will prevent the animation being applied to other Views like in example b):

```swift
// » SwiftUI Garden
// » https://swiftui-garden.com/Animations/Animating+value+changes
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
                    .animation(.linear(duration: 2)) { content in
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
```

For animations that are more than View changes based on value changes, see `PhaseAnimator` and `KeyframeAnimator`, [Controlling the timing and movements of your animations](https://developer.apple.com/documentation/SwiftUI/Controlling-the-timing-and-movements-of-your-animations)
