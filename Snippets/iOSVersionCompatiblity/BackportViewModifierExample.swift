// » SwiftUI Garden
// » https://swiftui-garden.com/Articles/Handling-different-iOS-versions-in-a-View-body

import SwiftUI

struct Backport<Content> {
    let content: Content
}

extension View {
    var backport: Backport<Self> { Backport(content: self) }
}

extension Backport where Content: View {
    @ViewBuilder func sectionIndexLabel(_ label: Text) -> some View {
        if #available(iOS 26, *) {
            content.sectionIndexLabel(label)
        } else {
            content
        }
    }
}
