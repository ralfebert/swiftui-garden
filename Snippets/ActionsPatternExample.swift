// » SwiftUI Garden
// » https://swiftui-garden.com/docs/Keeping-SwiftUI-Views-Simple-with-Actions-Pattern

import SwiftUI

struct Recipe {
    let id = UUID()
    let title: String
    let duration: Int
    let isStarred: Bool
}

struct RecipeView: View {
    let recipe: Recipe
    let actions: Actions

    struct Actions {
        init(open: @escaping () -> Void = {}, toggleStar: @escaping () -> Void = {}) {
            self.open = open
            self.toggleStar = toggleStar
        }

        var open: () -> Void
        var toggleStar: () -> Void
    }

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(recipe.title)
                    .font(.headline)

                HStack {
                    Image(systemName: "clock")
                    Text("\(recipe.duration) min")
                }
                .font(.caption)
                .foregroundStyle(.secondary)
            }

            Spacer()

            Button(action: actions.toggleStar) {
                Image(systemName: recipe.isStarred ? "star.fill" : "star")
                    .foregroundStyle(recipe.isStarred ? .yellow : .gray)
            }
            .buttonStyle(.plain)
        }
        .onTapGesture(perform: actions.open)
    }
}

#Preview {
    List {
        let recipe = Recipe(title: "Pasta Carbonara", duration: 20, isStarred: false)
        RecipeView(recipe: recipe, actions: .init())
    }
}
