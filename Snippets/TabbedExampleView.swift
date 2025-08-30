// SwiftUI Garden, https://swiftui-garden.com/

import SwiftUI

struct TabbedExampleView: View {
    var body: some View {
        TabView {
            NavigationStack {
                ExampleContentView(title: "First Tab")
            }
            .tabItem {
                Image(systemName: "1.circle")
                Text("First")
            }

            NavigationStack {
                ExampleContentView(title: "Second Tab")
                    .toolbar {
                        ToolbarItemGroup(placement: .navigationBarTrailing) {
                            Button(
                                action: {},
                                label: {
                                    Label("Quizzes", systemImage: "rectangle.stack")
                                }
                            )

                            Button(action: {}) {
                                Image(systemName: "ellipsis")
                            }
                        }
                    }
            }
            .tabItem {
                Image(systemName: "2.circle")
                Text("Second")
            }

            NavigationStack {
                ExampleContentView(title: "Third Tab")
            }
            .tabItem {
                Image(systemName: "3.circle")
                Text("Third")
            }
        }
    }
}

struct ExampleContentView: View {
    let title: String

    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
            Text("This is an example view")
                .foregroundColor(.secondary)
            NavigationLink("Go deep") {
                ExampleContentView(title: "Deep example")
            }
        }
        .navigationTitle(title)
    }
}

#Preview {
    TabbedExampleView()
}
