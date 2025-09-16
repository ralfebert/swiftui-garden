// » SwiftUI Garden
// » https://swiftui-garden.com/Shapes/Shape-Styles

import SwiftUI

struct ShapeStylesExample: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack {
            Image(.stripe)
                .resizable(resizingMode: .tile)
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 16) {

                Text(colorScheme == .dark ? "Dark Mode" : "Light Mode")
                    .font(.headline)

                VStack(alignment: .leading, spacing: 0) {
                    colorRow(style: .primary, ".primary", textStyle: .background)
                    colorRow(style: .secondary, ".secondary")
                    colorRow(style: .tertiary, ".tertiary")
                    colorRow(style: .quaternary, ".quaternary")
                    colorRow(style: .quinary, ".quinary")
                }

                VStack(alignment: .leading, spacing: 0) {
                    colorRow(style: .background, ".background")
                    colorRow(style: .background.secondary, ".background.secondary", notes: "(systemGray6)")
                    colorRow(style: .background.tertiary, ".background.tertiary", notes: colorScheme == .dark ? "(systemGray5)" : "(white)")
                    colorRow(style: .background.quaternary, ".background.quaternary", notes: colorScheme == .dark ? "(systemGray4)" : "(systemGray6)")
                }

                VStack(alignment: .leading, spacing: 0) {
                    colorRow(style: Color(uiColor: .systemGray), "Color(uiColor: .systemGray)")
                    colorRow(style: Color(uiColor: .systemGray2), "Color(uiColor: .systemGray2)")
                    colorRow(style: Color(uiColor: .systemGray3), "Color(uiColor: .systemGray3)")
                    colorRow(style: Color(uiColor: .systemGray4), "Color(uiColor: .systemGray4)")
                    colorRow(style: Color(uiColor: .systemGray5), "Color(uiColor: .systemGray5)")
                    colorRow(style: Color(uiColor: .systemGray6), "Color(uiColor: .systemGray6)")
                }

                VStack(alignment: .leading, spacing: 0) {
                    colorRow(style: .red, ".red")
                    colorRow(style: .red.secondary, ".red.secondary")
                    colorRow(style: .red.tertiary, ".red.tertiary")
                    colorRow(style: .red.quaternary, ".red.quaternary")
                }

            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()

        }
    }

    @ViewBuilder func colorRow(style: some ShapeStyle, _ title: String, notes: String? = nil, textStyle: some ShapeStyle = .primary) -> some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundStyle(style)
            VStack(alignment: .leading) {
                Text(title)
                    .bold()
                    .foregroundStyle(textStyle)
                if let notes {
                    Text(notes)
                        .font(.footnote)
                }
            }
            .padding(6)
        }
    }

}

#Preview {
    ShapeStylesExample()
}
