// SwiftUI Garden, https://swiftui-garden.com/

import SwiftUI

struct FontStylesView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(".largeTitle 34pt")
                .font(.largeTitle)

            Text(".title 28pt")
                .font(.title)

            Text(".title2 22pt")
                .font(.title2)

            Text(".title3 20pt")
                .font(.title3)

            Text(".headline 17pt bold")
                .font(.headline)

            Text(".body 17pt")
                .font(.body)

            Text(".callout 16pt")
                .font(.callout)

            Text(".subheadline 15pt")
                .font(.subheadline)

            Text(".footnote 13pt")
                .font(.footnote)

            Text(".caption 12pt")
                .font(.caption)

            Text(".caption2 11pt")
                .font(.caption2)
        }
        .navigationTitle(".font()")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        FontStylesView()
    }
}
