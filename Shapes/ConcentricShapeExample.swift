// » SwiftUI Garden
// » https://swiftui-garden.com/Shapes/ConcentricRectangle-and-ContainerRelativeShape

import SwiftUI

struct ConcentricShapeExample: View {
    var body: some View {
        ContainerExampleShape()
            .overlay(alignment: .leading) {
                ConcentricAndContainerRelativeRectangle()
                    .padding(.leading, 8)
            }
            .containerShape(RoundedRectangle(cornerRadius: 50))
    }
}

struct ContainerExampleShape: View {
    var body: some View {
        Color.blue.opacity(0.3)
            .frame(width: 300, height: 300)
            .clipShape(RoundedRectangle(cornerRadius: 50))
    }
}

struct ConcentricAndContainerRelativeRectangle: View {
    var body: some View {
        ZStack {
            ConcentricRectangle()
                .fill(Color.red.opacity(0.5))

            ContainerRelativeShape()
                .fill(Color.yellow.opacity(0.5))
        }
        .frame(width: 120, height: 120)
    }
}

#Preview {
    ConcentricShapeExample()
}
