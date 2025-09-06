// » SwiftUI Garden
// » https://swiftui-garden.com/Shapes/Shapes

import SwiftUI

struct ShapeTypesExample: View {
    var body: some View {
        Form {
            Section("Basic") {
                ShapeRow("Rectangle()") {
                    Rectangle()
                        .fill(.blue)
                        .frame(width: 80, height: 60)
                }

                ShapeRow("Circle()") {
                    Circle()
                        .fill(.blue)
                        .frame(width: 60, height: 60)
                }

                ShapeRow("Ellipse()") {
                    Ellipse()
                        .fill(.blue)
                        .frame(width: 80, height: 50)
                }
            }

            Section("Rounded") {
                ShapeRow("RoundedRectangle(cornerRadius: 12)") {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.blue)
                        .frame(width: 80, height: 60)
                }

                ShapeRow("RoundedRectangle(cornerSize:)") {
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))
                        .fill(.blue)
                        .frame(width: 80, height: 60)
                }

                ShapeRow("UnevenRoundedRectangle") {
                    UnevenRoundedRectangle(
                        cornerRadii: .init(
                            topLeading: 25,
                            bottomLeading: 5,
                            bottomTrailing: 25,
                            topTrailing: 5
                        )
                    )
                    .fill(.blue)
                    .frame(width: 80, height: 60)
                }

                ShapeRow("Capsule()") {
                    Capsule()
                        .fill(.blue)
                        .frame(width: 80, height: 40)
                }
            }

            Section("Container & Custom") {
                ShapeRow("ContainerRelativeShape()\nConcentricRectangle()") {
                    ZStack {
                        ContainerRelativeShape()
                            .fill(.white.secondary)
                            .padding(6)
                    }
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .containerShape(RoundedRectangle(cornerRadius: 12))
                    .frame(height: 60)
                }

                ShapeRow("Path { ... }") {
                    Path { path in
                        path.move(to: CGPoint(x: 40, y: 10))
                        path.addLine(to: CGPoint(x: 70, y: 50))
                        path.addLine(to: CGPoint(x: 10, y: 50))
                        path.closeSubpath()
                    }
                    .fill(.blue)
                    .frame(width: 80, height: 60)
                }
            }
        }
    }
}

struct ShapeRow<Content: View>: View {
    let label: String
    let content: Content

    init(_ label: String, @ViewBuilder content: () -> Content) {
        self.label = label
        self.content = content()
    }

    var body: some View {
        HStack {
            content
                .frame(width: 100, height: 80)
            Text(label)
                .multilineTextAlignment(.leading)
            Spacer()
        }
    }
}

#Preview {
    ShapeTypesExample()
}
