// » SwiftUI Garden
// » https://swiftui-garden.com/Misc/iOS-26/Touch-not-cancelled-on-sheet-drag

import SwiftUI

public extension View {
    // FB18927179: Button touch is not cancelled when sheet drag or scroll gesture starts
    // on a Button inside a ScrollView inside a .sheet, bug appeared in iOS 18, adding a
    // simultaneous TapGesture prevents the issue. It's enough to stick this once on the
    // outer container that is affected.
    // Thanks https://mastodon.social/@mergesort@macaw.social
    // https://developer.apple.com/forums/thread/763436?answerId=849716022#849716022
    @available(iOS, deprecated: 26.1, message: "Check if this is still needed for iOS 26.1. If it is, bump this deprecation message to a higher version.")
    @ViewBuilder
    func iOS18ScrollViewButtonTapSheetFix() -> some View {
        if #available(iOS 18, *) {
            self.simultaneousGesture(TapGesture())
        } else {
            self
        }
    }
}
