// SwiftUI Garden, https://swiftui-garden.com/

import SwiftUI

struct SafeAreaBarExample: View {
    var body: some View {
        NavigationStack {
            List {
                Text("Hello")
            }
            .listStyle(.plain)
            .navigationTitle("Example")
            .navigationBarTitleDisplayMode(.inline)
            .scrollEdgeEffectStyle(.hard, for: .top)
            .safeAreaBar(edge: .top, alignment: .leading) {
                Text("Safe Area Bar")
                    .font(.body.bold())
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("More", systemImage: "ellipsis") {}
                }
            }
        }
    }
}

#Preview {
    SafeAreaBarExample()
}
