// » SwiftUI Garden
// » https://swiftui-garden.com/Misc/iOS-26/Wiggly-SwiftUI-Glass-Buttons

import SwiftUI

enum Region: String, CaseIterable {
    case world
    case africa
    case americas
    case asia
    case europe
    case oceania
}

struct JumpyGlassViewExample: View {
    @State var region = Region.world

    var body: some View {
        NavigationStack {
            ZStack {
                Color.yellow
                    .ignoresSafeArea()
                VStack {
                    self.continentMenu
                        .border(Color.red)

                    Spacer()
                }
            }
            .navigationTitle("Example")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .title) {
                    self.continentMenu
                    .menuStyle(.button)
                    .buttonStyle(.glass)
                }
            }
        }
    }

    @ViewBuilder
    var continentMenu: some View {
        Menu(
            content: {
                ForEach(Region.allCases, id: \.self) { region in
                    Button(region.rawValue) {
                        self.region = region
                    }
                }
            },
            label: {
                HStack {
                    Text(region.rawValue.capitalized)
                    Image(systemName: "chevron.up.chevron.down")
                        .imageScale(.small)
                }
                .fontWeight(.semibold)
            }
        )
    }
    
}

#Preview {
    JumpyGlassViewExample()
}
