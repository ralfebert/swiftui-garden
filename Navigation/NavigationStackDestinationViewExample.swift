import SwiftUI

struct NavigationStackDestinationViewExample: View {
    var body: some View {
        NavigationStack {
            Form {
                NavigationLink(
                    destination: {
                        Text("Detail")
                            .navigationTitle("Detail View")
                    },
                    label: {
                        Label("Detail", systemImage: "square.dashed")
                    }
                )

            }
            .navigationTitle("Root View")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NavigationStackDestinationViewExample()
}
