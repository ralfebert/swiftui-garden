//

import SwiftUI

enum NavExampleTarget: Hashable {
    case detail
}

struct NavigationStackValueExample: View {
    var body: some View {
        NavigationStack {
            Form {
                NavigationLink(
                    value: NavExampleTarget.detail,
                    label: {
                        Label("Detail", systemImage: "square.dashed")
                    }
                )

            }
            .navigationTitle("Root View")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: NavExampleTarget.self) { value in
                switch value {
                case .detail:
                    NavExampleDetailView()
                }
            }
        }
    }
}

struct NavExampleDetailView: View {

    var body: some View {
        Text("Detail")
            .navigationTitle("Detail View")
    }

}

#Preview {
    NavigationStackValueExample()
}
