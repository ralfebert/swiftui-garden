// » SwiftUI Garden
// » https://swiftui-garden.com/Animations/View-Transitions

import SwiftUI

struct TransitionPlayground: View {
    @State private var showItem = false
    @State private var selectedTransition = TransitionType.opacity

    enum TransitionType: String, CaseIterable {
        case opacity = "Opacity (Default)"
        case slide = "Slide"
        case scale = "Scale"
        case move = "Move (Leading)"
        case asymmetric = "Asymmetric"
        case combined = "Combined"
        case blurReplace = "Blur Replace"
        case push = "Push"

        @ViewBuilder func apply(to view: some View) -> some View {
            switch self {
            case .opacity:
                view.transition(.opacity)
            case .slide:
                view.transition(.slide)
            case .scale:
                view.transition(.scale)
            case .move:
                view.transition(.move(edge: .leading))
            case .asymmetric:
                view.transition(.asymmetric(
                    insertion: .move(edge: .leading).combined(with: .opacity),
                    removal: .scale.combined(with: .opacity)
                ))
            case .combined:
                view.transition(.scale.combined(with: .opacity))
            case .blurReplace:
                view.transition(.blurReplace)
            case .push:
                view.transition(.push(from: .leading))
            }
        }
    }

    var body: some View {
        VStack {
            HStack {
                Picker("Transition Type", selection: $selectedTransition) {
                    ForEach(TransitionType.allCases, id: \.self) { type in
                        Text(type.rawValue).tag(type)
                    }
                }
                .buttonStyle(.bordered)
                .pickerStyle(.menu)

                Button("Toggle View") {
                    showItem.toggle()
                }
                .buttonStyle(.borderedProminent)
            }

            ZStack {
                if showItem {
                    selectedTransition.apply(to:
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue)
                            .frame(width: 200, height: 60)
                            .overlay(
                                Text("Transitioning View")
                                    .foregroundColor(.white)
                            )
                    )
                }
            }
            .frame(height: 150)
            .animation(.easeInOut(duration: 0.5), value: showItem)
        }
    }
}

#Preview {
    TransitionPlayground()
}
