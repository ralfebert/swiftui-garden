// » SwiftUI Garden
// » https://swiftui-garden.com/Animations/View-Transitions

import SwiftUI

struct DefaultTransitionExample: View {
    @State var showShape = false

    var body: some View {
        VStack {
            Toggle("Show shape", isOn: $showShape)
                .padding()

            ZStack {
                if showShape {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.blue)
                        .frame(width: 200, height: 100)
                }
            }
            .frame(height: 200)
            .animation(.easeInOut(duration: 0.5), value: showShape)
        }
    }
}

#Preview {
    DefaultTransitionExample()
}
