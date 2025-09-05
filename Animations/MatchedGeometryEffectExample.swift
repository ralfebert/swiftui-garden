import SwiftUI

struct MatchedGeometryEffectExample: View {
    @State var isTopLeft = true
    static let rectGeometryId = "rect"
    @Namespace var namespace

    var body: some View {
        ZStack {
            Button("Toggle") {
                self.isTopLeft.toggle()
            }
        }
        .frame(width: 300, height: 300)
        .overlay(alignment: .topLeading) {
            if isTopLeft {
                Rectangle()
                    .fill(Color.blue)
                    .matchedGeometryEffect(id: Self.rectGeometryId, in: self.namespace)
                    .frame(width: 100, height: 80)
            }
        }
        .overlay(alignment: .bottomTrailing) {
            if !isTopLeft {
                Rectangle()
                    .fill(Color.red)
                    .matchedGeometryEffect(id: Self.rectGeometryId, in: self.namespace)
                    .frame(width: 60, height: 100)
            }
        }
        .animation(.default, value: self.isTopLeft)
    }
}

#Preview {
    MatchedGeometryEffectExample()
}
