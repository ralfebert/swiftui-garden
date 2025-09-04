import SwiftUI

struct ViewTransitionExample: View {
    @State var shapeVisible = false
    
    var body: some View {
        VStack {
            Toggle("Show shape", isOn: $shapeVisible)
            
            ZStack {
                if shapeVisible {
                    Capsule()
                        .fill(.blue)
                        .frame(width: 150, height: 60)
                        .transition(.blurReplace)
                }
            }
            .frame(height: 200)
            .animation(.default, value: self.shapeVisible)
        }
        .padding()
    }
}

#Preview {
    ViewTransitionExample()
}
