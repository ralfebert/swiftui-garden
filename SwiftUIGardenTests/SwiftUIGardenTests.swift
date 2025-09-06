@testable import SwiftUIGarden
import SwiftUI
import Testing
import SnapshotTesting

@MainActor
@Suite(.snapshots(record: .all, diffTool: .checkDiff), .serialized)
struct SwiftUIGardenTests {

    let screenSize = UIScreen.main.bounds.size

    @Test func fontStyles() async throws {
        let styles = [
            (style: Font.largeTitle, name: "largeTitle", info: "34pt"),
            (style: Font.title, name: "title", info: "28pt"),
            (style: Font.title2, name: "title2", info: "22pt"),
            (style: Font.title3, name: "title3", info: "20pt"),
            (style: Font.headline, name: "headline", info: "17pt bold"),
            (style: Font.body, name: "body", info: "17pt"),
            (style: Font.callout, name: "callout", info: "16pt"),
            (style: Font.subheadline, name: "subheadline", info: "15pt"),
            (style: Font.footnote, name: "footnote", info: "13pt"),
            (style: Font.caption, name: "caption", info: "12pt"),
            (style: Font.caption2, name: "caption2", info: "11pt"),
        ]
        for style in styles {
            let view = Text(".\(style.name) \(style.info)")
                .font(style.style)
                .frame(width: 250, height: 70, alignment: .leading)

            assertSnapshot(of: view, as: .image, named: style.name)
        }
    }

    @Test func buttonStyles() async throws {
        func testButtonStyle(name: String, @ViewBuilder styleApplier: @escaping (Button<Label<Text, Image>>) -> some View) {

            let button = Button("Roll", systemImage: "dice") {
            }

            let view = styleApplier(button)
                .frame(width: 200, height: 70, alignment: .center)
                .background(
                    LinearGradient(
                    colors: [.yellow, .orange],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )

            assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: name.contains("glass")), named: name, testName: "buttonStyles")
        }

        testButtonStyle(name: "plain") { view in
            view.buttonStyle(.plain)
        }

        testButtonStyle(name: "borderless") { view in
            view.buttonStyle(.borderless)
        }

        testButtonStyle(name: "bordered") { view in
            view.buttonStyle(.bordered)
        }

        testButtonStyle(name: "borderedProminent") { view in
            view.buttonStyle(.borderedProminent)
        }

        testButtonStyle(name: "glass") { view in
            view.buttonStyle(.glass)
        }

        testButtonStyle(name: "glassProminent") { view in
            view.buttonStyle(.glassProminent)
        }

        testButtonStyle(name: "automatic") { view in
            view.buttonStyle(.automatic)
        }
    }

    @Test func customButtonStyle() async throws {
        let view = CustomButtonStyleView()
            .frame(width: screenSize.width, height: 100)

        assertSnapshot(of: view, as: .image)
    }

    @Test func modifiedButtonStyle() async throws {
        let view = ModifiedButtonStyleExample()
            .frame(width: screenSize.width, height: 100)

        assertSnapshot(of: view, as: .image)
    }

    @Test func shapeStyles() async throws {
        func testShapeStyle(style: some ShapeStyle, name: String) {
            for colorScheme in [ColorScheme.light, .dark] {
                
                let view = ZStack {
                    colorScheme == .dark ? Color(hue: 0.78, saturation: 0.75, brightness: 0.2) : Color.yellow
                    
                    Rectangle()
                        .foregroundStyle(style)
                        .frame(width: 50, height: 50)
                }
                    .frame(width: 100, height: 100)
                    .environment(\.colorScheme, colorScheme)

                assertSnapshot(of: view, as: .image, named: "\(name).\(colorScheme == .light ? "light" : "dark")", testName: "shapeStyles")
            }
        }

        testShapeStyle(style: .primary, name: "primary")
        testShapeStyle(style: .secondary, name: "secondary")
        testShapeStyle(style: .tertiary, name: "tertiary")
        testShapeStyle(style: .quaternary, name: "quaternary")
        testShapeStyle(style: .quinary, name: "quinary")
        testShapeStyle(style: .background, name: "background")
        testShapeStyle(style: .background.secondary, name: "background.secondary")
        testShapeStyle(style: .background.tertiary, name: "background.tertiary")
        testShapeStyle(style: .red, name: "red")
        testShapeStyle(style: .red.secondary, name: "red.secondary")
        testShapeStyle(style: .red.tertiary, name: "red.tertiary")
        testShapeStyle(style: .red.quaternary, name: "red.quaternary")
        testShapeStyle(style: .red.quinary, name: "red.quinary")

    }
    
    @Test func shapeTypes() async throws {
        let shapes: [(view: AnyView, name: String)] = [
            (AnyView(Rectangle()
                .fill(.blue)
                .frame(width: 80, height: 60)), "rectangle"),
            (AnyView(Circle()
                .fill(.blue)
                .frame(width: 60, height: 60)), "circle"),
            (AnyView(Ellipse()
                .fill(.blue)
                .frame(width: 80, height: 50)), "ellipse"),
            (AnyView(RoundedRectangle(cornerRadius: 12)
                .fill(.blue)
                .frame(width: 80, height: 60)), "roundedRectangle"),
            (AnyView(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))
                .fill(.blue)
                .frame(width: 80, height: 60)), "roundedRectangleCornerSize"),
            (AnyView(UnevenRoundedRectangle(
                cornerRadii: .init(
                    topLeading: 25,
                    bottomLeading: 5,
                    bottomTrailing: 25,
                    topTrailing: 5
                ))
                .fill(.blue)
                .frame(width: 80, height: 60)), "unevenRoundedRectangle"),
            (AnyView(Capsule()
                .fill(.blue)
                .frame(width: 80, height: 40)), "capsule"),
            (AnyView(
                ZStack {
                    ContainerRelativeShape()
                        .fill(.white.secondary)
                        .padding(6)
                }
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .containerShape(RoundedRectangle(cornerRadius: 12))
                .frame(width: 80, height: 60)
            ), "containerRelativeShape"),
            (AnyView(Path { path in
                path.move(to: CGPoint(x: 40, y: 10))
                path.addLine(to: CGPoint(x: 70, y: 50))
                path.addLine(to: CGPoint(x: 10, y: 50))
                path.closeSubpath()
            }
            .fill(.blue)
            .frame(width: 80, height: 60)), "path")
        ]
        
        for shape in shapes {
            let view = shape.view
                .frame(width: 100, height: 80)
            
            assertSnapshot(of: view, as: .image, named: shape.name, testName: "shapeTypes")
        }
    }

    @Test func concentricRect() async throws {

        let insetExample = Color.blue.opacity(0.3)
            .frame(width: 300, height: 200)
            .overlay(alignment: .leading) {
                ZStack {
                    ConcentricRectangle()
                        .fill(Color.blue.opacity(0.3))
                }
                .padding(20)

                ZStack {
                    ConcentricRectangle()
                        .fill(Color.blue.opacity(0.3))
                }
                .padding(40)

                ZStack {
                    ConcentricRectangle()
                        .fill(Color.blue.opacity(0.3))
                }
                .padding(60)

            }
            .clipShape(RoundedRectangle(cornerRadius: 50))
            .containerShape(RoundedRectangle(cornerRadius: 50))

        assertSnapshot(of: insetExample, as: .image, named: "insetExample", testName: "concentricRect")

        let borderProximityExample =      HStack {
            ContainerExampleShape()
                .overlay(alignment: .leading) {
                    ConcentricAndContainerRelativeRectangle()
                        .padding(.leading, 8)
                }
                .containerShape(RoundedRectangle(cornerRadius: 50))
            
            ContainerExampleShape()
                .overlay(alignment: .topLeading) {
                    ConcentricAndContainerRelativeRectangle()
                        .padding(8)
                }
                .containerShape(RoundedRectangle(cornerRadius: 50))
        }

        assertSnapshot(of: borderProximityExample, as: .image, named: "borderProximity", testName: "concentricRect")


        let cornerExample =         ContainerExampleShape()
            .overlay(alignment: .topLeading) {
                ConcentricAndContainerRelativeRectangle()
                    .padding(.leading, 8)
                    .padding(.top, 30)
            }
            .containerShape(RoundedRectangle(cornerRadius: 50))

        assertSnapshot(of: cornerExample, as: .image, named: "cornerExample", testName: "concentricRect")

        let uniformExample =         ContainerExampleShape()
            .overlay(alignment: .topLeading) {
                ConcentricRectangle(corners: .concentric, isUniform: true)
                    .fill(Color.red.opacity(0.5))
                    .frame(width: 120, height: 120)
                    .padding(.leading, 8)
                    .padding(.top, 30)
            }
            .containerShape(RoundedRectangle(cornerRadius: 50))

        assertSnapshot(of: uniformExample, as: .image, named: "uniformExample", testName: "concentricRect")

    }
    
    
}
