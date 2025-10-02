// » SwiftUI Garden
// » https://swiftui-garden.com/Misc/SwiftUI-Conditional-Modifier-Issue

import SwiftUI

struct ConditionalModifierIssueExample: View {
    @State private var isBold = false
    @State private var counter = 0

    var body: some View {
        Form {
            Toggle("Make Text Bold", isOn: $isBold)

            ConditionalInnerView()
        }
        // Warning: Bad example to demonstrate the
        // "Conditions in View modifiers are dangerous" issue
        .if(isBold) { content in
            content.bold()
        }
    }
}

struct ConditionalInnerView: View {
    @State private var counter = 0

    var body: some View {
        Stepper("Counter: \(counter)", value: $counter)
    }
}

public extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `if`(_ condition: Bool, @ViewBuilder transform: (Self) -> some View) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }

}

#Preview {
    ConditionalModifierIssueExample()
}
