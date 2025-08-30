// SwiftUI Garden, https://swiftui-garden.com/

import SwiftUI

struct DarkModeColorsExperiment: View {
    var body: some View {
        ZStack {

            Color(red: 0, green: 0, blue: 0.4)
                .ignoresSafeArea()

            VStack {

                Text(".primary")
                    .font(.title)
                    .foregroundStyle(.primary)
                    .padding()
                    .glassEffect()

                Text(".primary")
                    .font(.title)
                    .foregroundStyle(.primary)
            }

        }
    }
}

#Preview {
    DarkModeColorsExperiment()
}
