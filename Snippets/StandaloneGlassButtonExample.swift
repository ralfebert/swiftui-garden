// » SwiftUI Garden
// » https://swiftui-garden.com/Misc/iOS-26/Standalone-Glass-Buttons-widen-to-a-capsule-when-tapped
// » https://github.com/ralfebert/swiftui-garden/blob/main/Snippets/StandaloneGlassButtonExample.swift

import MapKit
import SwiftUI

struct StandaloneGlassButtonExample: View {
    var body: some View {
        NavigationStack {
            Color.yellow
                .ignoresSafeArea()
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        self.menu
                    }
                }
                .overlay(alignment: .topLeading) {
                    VStack {
                        self.labelButton
                            .padding()

                        Button(
                            action: {},
                            label: {
                                Label("Close", systemImage: "xmark")
                                    .labelStyle(.iconOnly)
                                    .imageScale(.large)
                                    .frame(width: 32, height: 32)
                            }
                        )
                        .buttonStyle(.glass)
                        .buttonBorderShape(.circle)
                    }
                }
        }
    }

    @ViewBuilder
    var menu: some View {
        Menu {
            Button("Option 1", action: {})
            Button("Option 2", action: {})
            Button("Option 3", action: {})
        } label: {
            Image(systemName: "ellipsis")
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
    StandaloneGlassButtonExample()
}
