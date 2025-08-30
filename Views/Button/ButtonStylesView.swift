// SwiftUI Garden, https://swiftui-garden.com/

import SwiftUI

struct ButtonStylesView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.yellow, .orange],
                startPoint: .leading,
                endPoint: .trailing
            )
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
        .navigationTitle(".buttonStyle()")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ButtonStylesView()
    }
}
