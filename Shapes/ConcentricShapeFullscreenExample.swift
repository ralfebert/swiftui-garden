// » SwiftUI Garden
// » https://swiftui-garden.com/Shapes/ConcentricRectangle-and-ContainerRelativeShape

import SwiftUI

enum Experiment: String, CaseIterable, Identifiable {
    case concentricRect
    case scrollableConcentricRect
    case uniformConcentricRect
    case containerRelative

    var title: String {
        switch self {
        case .concentricRect:
            "concentricRect"
        case .scrollableConcentricRect:
            "concentricRect (scrollable)"
        case .uniformConcentricRect:
            "concentricRect (uniform)"
        case .containerRelative:
            "containerRelative"
        }
    }

    var id: String {
        self.rawValue
    }
}

struct ConcentricShapeFullscreenExample: View {
    @State var experiment: Experiment = .concentricRect
    @State var showSheet = false

    var body: some View {
        Group {
            switch experiment {
            case .concentricRect:
                ShapeView {
                    ConcentricRectangle()
                }

            case .scrollableConcentricRect:
                ScrollView {
                    ShapeView {
                        ConcentricRectangle()
                    }
                    .frame(height: 1000)
                }

            case .uniformConcentricRect:
                ShapeView {
                    ConcentricRectangle(corners: .concentric, isUniform: true)
                }

            case .containerRelative:
                ShapeView {
                    ContainerRelativeShape()
                }
            }

        }
        .ignoresSafeArea()
        .overlay {
            VStack {
                Picker("Experiment", selection: $experiment) {
                    ForEach(Experiment.allCases, id: \.self) { experiment in
                        Text(experiment.title).tag(experiment)
                    }
                }
                .menuStyle(.button)
                .pickerStyle(.menu)

                Button("Show Sheet") {
                    self.showSheet = true
                }
            }
            .padding()
            .glassEffect()
        }
        .sheet(isPresented: $showSheet) {
            ConcentricShapeFullscreenExample()
        }

    }
}

struct ShapeView<S: Shape>: View {
    @ViewBuilder let content: () -> S

    var body: some View {
        VStack {
            HStack {
                content()
                    .fill(Color.yellow)
                    .frame(height: 80)
                    .frame(maxWidth: .infinity)

                content()
                    .fill(Color.orange)
                    .frame(height: 80)
                    .frame(maxWidth: .infinity)
            }

            content()
                .fill(Color.green)
                .frame(height: 80)
                .frame(maxWidth: .infinity)

            content()
                .fill(Color.blue)
                .frame(maxHeight: .infinity)
                .frame(maxWidth: .infinity)

        }
        .padding()
    }
}

#Preview {
    ConcentricShapeFullscreenExample()
}
