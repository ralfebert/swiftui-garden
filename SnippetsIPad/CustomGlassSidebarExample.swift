// » SwiftUI Garden
// » https://swiftui-garden.com/Misc/iOS-26/Custom-glass-sidebar-on-iPad-Workaround
// » https://github.com/ralfebert/swiftui-garden/blob/main/SnippetsIPad/CustomGlassSidebarExample.swift

import MapKit
import SwiftUI

struct CustomGlassSidebarExample: View {

    var body: some View {
        Map()
            .overlay(alignment: .leading) {

                NavigationStack {
                    CustomGlassSidebarExampleScrollView()
                        .toolbar {
                            ToolbarItem(placement: .topBarTrailing) {
                                Menu(
                                    content: {
                                        Button("Example") {}
                                    },
                                    label: {
                                        Image(systemName: "ellipsis")
                                    }
                                )
                            }
                        }
                        .toolbar {
                            ToolbarItemGroup(placement: .bottomBar) {
                                Button("Example", systemImage: "square.dashed") {}

                                Spacer()

                                Button("Example", systemImage: "square.dashed") {}
                            }

                        }
                        .navigationTitle("Example")
                        .navigationBarTitleDisplayMode(.inline)
                        .containerBackground(Color.clear, for: .navigation)
                }
                .frame(width: 400)
                .frame(maxHeight: .infinity)
                // .background + Color.clear is a workaround for glass disappearing when a Menu opens (last tested on Beta 8)
                .background {
                    Color.clear
                        .glassEffect(in: .rect(cornerRadius: 36))
                }
                .clipShape(.rect(cornerRadius: 36))
                .padding([.horizontal, .top])
            }
    }

}

struct CustomGlassSidebarExampleScrollView: View {

    var body: some View {

        ScrollView {
            VStack {
                ForEach(1 ... 30, id: \.self) { i in
                    NavigationLink(
                        destination: {
                            CustomGlassSidebarExampleScrollView()
                        },
                        label: {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.background)
                                .frame(maxWidth: .infinity)
                                .frame(height: 100)
                                .overlay {
                                    Text("\(i)")
                                }
                        }
                    )
                }
            }
            .padding()
        }
        .navigationTitle("Glass Sidebar Example")
        .navigationBarTitleDisplayMode(.inline)
        .containerBackground(Color.clear, for: .navigation)

    }
}

#Preview {
    CustomGlassSidebarExample()
}
