import SwiftUI
internal import UniformTypeIdentifiers

struct ShareLinkExample: View {
    var body: some View {
        VStack(spacing: 30) {
            ShareLink(
                item: URL(string: "https://www.example.com")!)
            {
                Label("Share URL", systemImage: "square.and.arrow.up")
            }
            .buttonStyle(.borderedProminent)

            // I want to show a share sheet in SwiftUI after doing async work (there's a websocket client behind, not just a simple url fetch). Right now I'm using UIActivityViewController wrapped as UIViewControllerRepresentable, but this seems to have an issue where the share sheet sometimes appears empty.
            // I found ShareLink but this doesn't seem to be suitable for the async case, there's no .shareSheet(isPresented: )-style API. Is there a way to build such a flow using swiftui-native APIs?
            
            // Async experiment with async DataRepresentation:
            // This doesn't work well: UI freezes, no URL preview
            ShareLink(item: AsyncURLItem(), preview: SharePreview("foo")) {
                Label("Share (Async)", systemImage: "square.and.arrow.up")
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
}

struct AsyncURLItem: Transferable {
    static var transferRepresentation: some TransferRepresentation {
        DataRepresentation(exportedContentType: .url) { item in
            // Simulate async work to retrieve the URL
            try await Task.sleep(for: .seconds(1))
            return "https://www.example.com/12345".data(using: .utf8)!
        }
    }
}

#Preview {
    ShareLinkExample()
}
