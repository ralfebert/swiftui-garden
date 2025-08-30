// SwiftUI Garden, https://swiftui-garden.com/

import SwiftUI

enum Mood: String, CaseIterable {
    case happy = "Happy"
    case sad = "Sad"
    case excited = "Excited"

    var title: String {
        self.rawValue.capitalized
    }
}

struct PickerExampleView: View {
    @State private var mood: Mood = .happy

    var body: some View {
        Form {
            Picker("Mood", selection: $mood) {
                ForEach(Mood.allCases, id: \.self) { mode in
                    Text(mode.title).tag(mode)
                }
            }
            .pickerStyle(.segmented)

            Text("Selection: \(mood.rawValue)")
        }
    }
}

#Preview {
    PickerExampleView()
}
