// SwiftUI Garden, https://swiftui-garden.com/

import SwiftUI

struct AnimatedValueExample: View {
    @State var value1 = false
    @State var value2 = false

    var body: some View {
        VStack {
            HStack {
                (value1 ? Color.red : Color.blue)
                    .frame(width: 120, height: 120)

                (value2 ? Color.red : Color.blue)
                    .frame(width: 120, height: 120)
            }
            .frame(width: 180, height: 180)

            Button("Animate", systemImage: "play.fill") {
                self.value1.toggle()
                self.value2.toggle()
            }
            .buttonStyle(.borderedProminent)
        }
        // Gotcha: this will also animate the change triggered by value2 as the change happens in the same View update
        .animation(.linear(duration: 2), value: value1)
    }
}

#Preview {
    AnimatedValueExample()
}
