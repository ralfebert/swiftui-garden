// SwiftUI Garden, https://swiftui-garden.com/

import SwiftUI

struct OnGeometryChangeVisibleRowsExample: View {
    @State private var fullyVisibleItems: Set<Int> = []

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(0 ..< 20, id: \.self) { index in
                        Text("Row \(index)")
                            .frame(height: 120)
                            .frame(maxWidth: .infinity)
                            .background(fullyVisibleItems.contains(index) ? Color.green : Color.gray)
                            .onGeometryChange(for: Bool.self) { proxy in
                                let frame = proxy.frame(in: .scrollView)
                                let size = (proxy.bounds(of: .scrollView) ?? .zero).size
                                let bounds = CGRect(origin: .zero, size: size)
                                let fullyVisible = bounds.contains(frame)
                                return fullyVisible
                            } action: { fullyVisible in
                                if fullyVisible {
                                    fullyVisibleItems.insert(index)
                                } else {
                                    fullyVisibleItems.remove(index)
                                }
                            }
                    }
                }
            }
            .navigationTitle("Fully Visible Rows via .onGeometryChange")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    OnGeometryChangeVisibleRowsExample()
}
