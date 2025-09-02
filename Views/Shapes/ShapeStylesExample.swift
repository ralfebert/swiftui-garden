// » SwiftUI Garden
// » https://swiftui-garden.com/Views/Shapes/Shape-Styles
// » https://github.com/ralfebert/swiftui-garden/blob/main/Views/Shapes/ShapeStylesExample.swift

// SwiftUI Garden, https://swiftui-garden.com/

import SwiftUI

struct ShapeStylesExample: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ZStack {
            (colorScheme == .dark ? Color(hue: 0.78, saturation: 0.75, brightness: 0.2) : Color.yellow).ignoresSafeArea()

            VStack(alignment: .leading, spacing: 16) {

                VStack(alignment: .leading, spacing: 0) {
                    colorRow(style: .primary, ".primary")
                    colorRow(style: .secondary, ".secondary")
                    colorRow(style: .tertiary, ".tertiary")
                    colorRow(style: .quaternary, ".quaternary")
                    colorRow(style: .quinary, ".quinary")
                }

                VStack(alignment: .leading, spacing: 0) {
                    colorRow(style: .background, ".background")
                    colorRow(style: .background.secondary, ".background.secondary")
                    colorRow(style: .background.tertiary, ".background.tertiary")
                }

                VStack(alignment: .leading, spacing: 0) {
                    colorRow(style: .red, ".red")
                    colorRow(style: .red.secondary, ".red.secondary")
                    colorRow(style: .red.tertiary, ".red.tertiary")
                    colorRow(style: .red.quaternary, ".red.quaternary")
                    colorRow(style: .red.quinary, ".red.quinary")
                }

            }

            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()

        }
    }

    @ViewBuilder func colorRow(style: some ShapeStyle, _ title: String) -> some View {
        HStack {
            Rectangle()
                .foregroundStyle(style)
                .frame(width: 50, height: 50)
            Text(title)
        }
    }

}

#Preview {
    ShapeStylesExample()
}
