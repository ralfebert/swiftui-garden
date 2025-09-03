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

}
