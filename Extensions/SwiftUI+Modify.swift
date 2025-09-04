// » SwiftUI Garden
// » https://swiftui-garden.com/Articles/Handling-different-iOS-versions-in-a-View-body

import SwiftUI

public extension View {
    func modify(@ViewBuilder transform: (Self) -> some View) -> some View {
        if #available(iOS 26, *) {
            content
                .sectionIndexLabel(Text("..."))
        } else {
            content
        }
    }
}
