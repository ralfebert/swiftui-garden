import SwiftUI

struct SheetWithFormWithTextFieldExample: View {
    @State private var text = ""

    var body: some View {
        Color.yellow
            .ignoresSafeArea()
            .sheet(isPresented: .constant(true)) {
                NavigationStack {
                    Form {
                        TextField("Enter text", text: $text)
                    }
                    .navigationTitle("Form")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button(role: .confirm) {}
                        }
                    }
                }
                .presentationDetents([.large])
            }
    }
}

#Preview {
    SheetWithFormWithTextFieldExample()
}
