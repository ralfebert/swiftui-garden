// SwiftUI Garden, https://swiftui-garden.com/

import SwiftUI

struct SheetOverSheetExample: View {
    @State var otherSheetVisible = false

    var body: some View {
        Color.yellow
            .ignoresSafeArea()
            .sheet(isPresented: .constant(true)) {
                NavigationStack {
                    VStack {
                        Text("Hello")
                            .navigationTitle("Hello")
                            .navigationBarTitleDisplayMode(.inline)

                        Button("Toggle 2nd sheet") {
                            self.otherSheetVisible.toggle()
                        }

                    }
                }
                .interactiveDismissDisabled()
                .presentationDetents([.medium, .large])
                .sheet(isPresented: $otherSheetVisible) {
                    NavigationStack {
                        Text("123")
                            .navigationTitle("Hello")
                            .navigationBarTitleDisplayMode(.inline)
                    }
                }
            }
    }
}

#Preview {
    SheetOverSheetExample()
}
