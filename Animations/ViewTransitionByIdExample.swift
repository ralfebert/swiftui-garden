// » SwiftUI Garden
// » https://swiftui-garden.com/Animations/View-Transitions

import SwiftUI

struct ViewTransitionByIdExample: View {
    @State var slide = 1

    var body: some View {
        VStack {
            Button("Next slide") {
                self.slide += 1
            }

            ZStack {
                Capsule()
                    .fill((slide % 2 == 0) ? .blue : .red)
                    .overlay {
                        Text("\(slide)")
                    }
                    .frame(width: 150, height: 60)
                    .id(slide)
                    .transition(.blurReplace)
            }
            .frame(height: 200)
            .animation(.default, value: self.slide)
        }
        .padding()
    }
}

#Preview {
    ViewTransitionByIdExample()
}
