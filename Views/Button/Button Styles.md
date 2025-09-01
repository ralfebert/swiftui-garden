
| Style                                        |                                                           |
| -------------------------------------------- | --------------------------------------------------------- |
| ![[buttonStyles.borderless.png\|200]]        | `.buttonStyle(.automatic)`<br>`.buttonStyle(.borderless)` |
| ![[buttonStyles.plain.png\|200]]             | `.buttonStyle(.plain)`                                    |
| ![[buttonStyles.bordered.png\|200]]          | `.buttonStyle(.bordered)`                                 |
| ![[buttonStyles.borderedProminent.png\|200]] | `.buttonStyle(.borderedProminent)`                        |
| ![[buttonStyles.glass.png\|200]]             | `.buttonStyle(.glass)`                                    |
| ![[buttonStyles.glassProminent.png\|200]]    | `.buttonStyle(.glassProminent)`                           |

```swift
// » SwiftUI Garden
// » https://swiftui-garden.com/Views/Button/Button-Styles
// » https://github.com/ralfebert/swiftui-garden/blob/main/Views/Button/ButtonStylesView.swift

import SwiftUI

struct ButtonStylesView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.yellow, .orange],
                startPoint: .leading,
                endPoint: .trailing
            )
            .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 16) {
                Button(".automatic") {}
                    .buttonStyle(.automatic)

                Button(".borderless") {}
                    .buttonStyle(.borderless)

                Button(".plain") {}
                    .buttonStyle(.plain)

                Button(".bordered") {}
                    .buttonStyle(.bordered)

                Button(".borderedProminent") {}
                    .buttonStyle(.borderedProminent)

                Button(".glass") {}
                    .buttonStyle(.glass)

                Button(".glassProminent") {}
                    .buttonStyle(.glassProminent)
            }
        }
    }
}

#Preview {
    NavigationStack {
        ButtonStylesView()
    }
}
```
