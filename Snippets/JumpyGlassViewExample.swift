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
                    self.labelButton
                    Spacer()
                }
            }
            .navigationTitle("Example")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
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
                    .menuStyle(.button)
                    .buttonStyle(.glass)
                }

                ToolbarItem(placement: .topBarTrailing) {
                    self.plainLabelButton
                }
            }
        }
    }

    @ViewBuilder
    var plainLabelButton: some View {
        Menu {
            Button("Option 1", action: {})
            Button("Option 2", action: {})
            Button("Option 3", action: {})
        } label: {
            Label("More", systemImage: "ellipsis")
        }
    }

    @ViewBuilder
    var labelButton: some View {
        Menu {
            Button("Option 1", action: {})
            Button("Option 2", action: {})
            Button("Option 3", action: {})
        } label: {
            Label("More", systemImage: "ellipsis")
                .labelStyle(.iconOnly)
                .imageScale(.large)
                .frame(width: 32, height: 32)
        }
        .menuStyle(.button)
        .buttonStyle(.glass)
        .buttonBorderShape(.circle)
    }
}

#Preview {
    JumpyGlassViewExample()
}
