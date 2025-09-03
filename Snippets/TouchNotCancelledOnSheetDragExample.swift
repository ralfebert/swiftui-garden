// » SwiftUI Garden
// » https://swiftui-garden.com/Misc/iOS-26/Touch-not-cancelled-on-sheet-drag

import SwiftUI

struct TouchNotCancelledOnSheetDragExample: View {
    @State var showAlert = false

    var body: some View {
        Text("Hello, world!")
            .sheet(isPresented: .constant(true)) {
                NavigationStack {
                    ScrollView(.vertical) {
                        VStack {
                            ForEach(1 ... 100, id: \.self) { _ in
                                Button("Hello World") {
                                    self.showAlert = true
                                }
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .buttonStyle(.borderedProminent)
                        // Workaround: .iOS18ScrollViewButtonTapSheetFix()
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Button tapped"))
                    }
                    .navigationTitle("Scrollable view in sheet")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
    }
}

#Preview {
    TouchNotCancelledOnSheetDragExample()
}
