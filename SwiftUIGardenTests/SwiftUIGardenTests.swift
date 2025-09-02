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
        let lightView = ShapeStylesExample()
            .frame(width: screenSize.width, height: screenSize.height)
            .environment(\.colorScheme, .light)

        let darkView = ShapeStylesExample()
            .frame(width: screenSize.width, height: screenSize.height)
            .environment(\.colorScheme, .dark)

        assertSnapshot(of: lightView, as: .image, named: "light")
        assertSnapshot(of: darkView, as: .image, named: "dark")
    }

}
