// » SwiftUI Garden
// » https://swiftui-garden.com/Views/Button/Button-Styles

import SwiftUI

struct ButtonStylesView: View {
    var body: some View {
        ZStack {
            Image(.stripe)
                .resizable(resizingMode: .tile)
                .opacity(0.5)
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 16) {
                Button(".automatic") {}
                    .buttonStyle(.automatic)

                Button(".borderless") {}
                    .buttonStyle(.borderless)

                Button(".plain") {}
                    .buttonStyle(.plain)

                Button(".bordered") {}
                    .buttonStyle(.bordered)

                Button(".borderedProminent") {}
                    .buttonStyle(.borderedProminent)

                Button(".glass") {}
                    .buttonStyle(.glass)

                Button(".glassProminent") {}
                    .buttonStyle(.glassProminent)
            }
        }
    }
}

#Preview {
    ButtonStylesView()
}
