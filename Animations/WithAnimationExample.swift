// SwiftUI Garden, https://swiftui-garden.com/

import SwiftUI

struct AnimationExample: View {
    @State var value = false

    var body: some View {
        VStack {
            HStack {
                let size: CGFloat = value ? 150 : 60

                (value ? Color.red : Color.blue)
                    .frame(width: size, height: size)
                    .cornerRadius(value ? 30 : 5)
            }
            .frame(width: 180, height: 180)

            Button("Animate", systemImage: "play.fill") {
                withAnimation {
                    self.value.toggle()
                }
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    AnimationExample()
}
