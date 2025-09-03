// » SwiftUI Garden
// » https://swiftui-garden.com/Misc/iOS-26/Animation-when-selected-presentationDetent-for-sheet-must-change

import SwiftUI

struct SheetAnimationWhenSelectedPresentationDetentMustChangeExample: View {
    var body: some View {
        Color.yellow
            .ignoresSafeArea()
            .sheet(isPresented: .constant(true)) {
                StartView()
            }
    }
}

struct StartView: View {
    enum PresentationDetentOption: CaseIterable {
        case mediumOrLarge
        case mediumOnly
        case largeOnly

        var displayName: String {
            switch self {
            case .mediumOnly:
                "Medium Only"
            case .largeOnly:
                "Large Only"
            case .mediumOrLarge:
                "Medium | Large"
            }
        }

        var detents: Set<PresentationDetent> {
            switch self {
            case .mediumOnly:
                [.medium]
            case .largeOnly:
                [.large]
            case .mediumOrLarge:
                [.medium, .large]
            }
        }
    }

    @State var selectedDetentOption: PresentationDetentOption = .mediumOnly

    var body: some View {
        VStack {
            Picker("Presentation Detents", selection: $selectedDetentOption) {
                ForEach(PresentationDetentOption.allCases, id: \.self) { option in
                    Text(option.displayName).tag(option)
                }
            }
            .pickerStyle(.segmented)
            .padding()
        }
        .presentationDetents(selectedDetentOption.detents)
    }
}

#Preview {
    SheetAnimationWhenSelectedPresentationDetentMustChangeExample()
}
