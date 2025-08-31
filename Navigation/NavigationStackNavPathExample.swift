import SwiftUI

enum NavChoice: String, Hashable, CaseIterable {
    case a
    case b
    case c
}

struct NavigationStackNavPathExample: View {
    @State var navPath: [NavChoice] = []
    var body: some View {
        NavigationStack(path: $navPath) {
            NavExampleChoiceView()
                .navigationTitle("Root View")
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(for: NavChoice.self) { value in
                    switch value {
                    case .a, .b, .c:
                        NavExampleChoiceView()
                            .navigationTitle(value.rawValue)
                    }
                }
        }
        .overlay(alignment: .bottom) {
            Color.yellow
                .frame(height: 100)
                .overlay {
                    Text("navPath: \(String(describing: navPath))")
                }
        }
    }
}

struct NavExampleChoiceView: View {
    var body: some View {
        Form {
            ForEach(NavChoice.allCases, id: \.self) { target in
                NavigationLink(
                    value: target,
                    label: {
                        Label(target.rawValue, systemImage: "square.dashed")
                    }
                )
            }
        }
    }
}

#Preview {
    NavigationStackNavPathExample()
}
