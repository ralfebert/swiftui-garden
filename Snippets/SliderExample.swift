// SwiftUI Garden, https://swiftui-garden.com/

import Foundation
import SwiftUI

struct SliderExample: View {
    @State private var value: Float = 0

    var body: some View {
        Form {
            Text("\(value)")
            Slider(value: $value, in: -10 ... 10, step: 0.5, label: { Text("Decimal Value") })
        }
    }
}

#Preview {
    SliderExample()
}
