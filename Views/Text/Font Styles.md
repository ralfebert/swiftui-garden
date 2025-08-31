<a href="https://github.com/ralfebert/swiftui-garden/edit/main/Views/Text/Font%20Styles.md"><em>edit ✏️</em></a>

| Style                                |                       |
| ------------------------------------ | --------------------- |
| ![[fontStyles.largeTitle.png\|250]]  | `.font(.largeTitle)`  |
| ![[fontStyles.title.png\|250]]       | `.font(.title)`       |
| ![[fontStyles.title2.png\|250]]      | `.font(.title2)`      |
| ![[fontStyles.title3.png\|250]]      | `.font(.title3)`      |
| ![[fontStyles.headline.png\|250]]    | `.font(.headline)`    |
| ![[fontStyles.body.png\|250]]        | `.font(.body)`        |
| ![[fontStyles.callout.png\|250]]     | `.font(.callout)`     |
| ![[fontStyles.subheadline.png\|250]] | `.font(.subheadline)` |
| ![[fontStyles.footnote.png\|250]]    | `.font(.footnote)`    |
| ![[fontStyles.caption.png\|250]]     | `.font(.caption)`     |
| ![[fontStyles.caption2.png\|250]]    | `.font(.caption2)`    |

```swift
// » SwiftUI Garden
// » https://swiftui-garden.com/Views/Text/Font+Styles
// » https://github.com/ralfebert/swiftui-garden/blob/main/Views/Text/FontStylesView.swift

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
    }
}

#Preview {
    FontStylesView()
}
```
