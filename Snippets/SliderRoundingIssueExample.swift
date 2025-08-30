// SwiftUI Garden, https://swiftui-garden.com/

import Foundation
import SwiftUI

private extension Double {

    var scaledBy1000: Double {
        get { Double(self) * 1000 }
        set {
            self = (newValue / 1000)
        }
    }

}

struct SliderRoundingIssueExample: View {
    @State private var doubleValue: Double = 0

    var body: some View {
        Form {
            Text("\(doubleValue)")
            Text("\(doubleValue.scaledBy1000)")
            Slider(value: $doubleValue.scaledBy1000, in: 8 ... 37, step: 1, label: { Text("Decimal Value") })
        }
    }
}

#Preview {
    SliderRoundingIssueExample()
}
