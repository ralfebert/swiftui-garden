// SwiftUI Garden, https://swiftui-garden.com/

import SwiftUI

struct Fruit: Identifiable {
    var id = UUID()
    var name: String

    static let exampleData = [
        Fruit(name: "Apple"),
        Fruit(name: "Banana"),
        Fruit(name: "Cherry"),
        Fruit(name: "Date"),
        Fruit(name: "Elderberry"),
        Fruit(name: "Fig"),
    ]
}

struct ListItemMoveExampleView: View {
    @State private var fruits = Fruit.exampleData

    var body: some View {
        NavigationStack {
            List {
                ForEach(fruits) { fruit in
                    Text(fruit.name)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Fruits")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button("Shuffle", systemImage: "shuffle") {
                        withAnimation {
                            self.shuffleItem()
                        }
                    }
                }
            }
        }
    }

    func shuffleItem() {
        self.fruits.move(fromOffsets: [self.fruits.indices.randomElement()!], toOffset: 0)
    }

}

#Preview {
    ListItemMoveExampleView()
}
