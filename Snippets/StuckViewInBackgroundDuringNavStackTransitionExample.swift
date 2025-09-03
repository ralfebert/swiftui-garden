// » SwiftUI Garden
// » https://swiftui-garden.com/Misc/iOS-26/View-Stuck-in-background-during-transitions-in-a-nav-stack-with-glass-backgrounds

import MapKit
import SwiftUI

struct StuckViewInBackgroundDuringNavStackTransitionExample: View {
    var body: some View {
        Map()
            .sheet(isPresented: .constant(true)) {
                StuckBgMainView()
                    .presentationDetents([.medium, .large])
                    .presentationBackgroundInteraction(.enabled)
                    .interactiveDismissDisabled()
            }
    }
}

struct City: Identifiable, Hashable {
    var id: String { name }
    let name: String
}

enum NavTarget: Hashable {
    case cities
}

struct StuckBgMainView: View {
    var body: some View {
        NavigationStack {
            ScrollView([.vertical]) {
                NavigationLink(value: NavTarget.cities) {
                    Text("Cities")
                }
            }
            .navigationTitle("Example")
            .navigationBarTitleDisplayMode(.inline)
            .containerBackground(Color.clear, for: .navigation)
            .navigationDestination(for: NavTarget.self) { navTarget in
                switch navTarget {
                case .cities:
                    CitiesListView()
                }
            }
            .navigationDestination(for: City.self) { city in
                CityView(city: city)
            }
        }
    }
}

struct CitiesListView: View {
    var cities: [City] = [
        "New York",
        "London",
        "Tokyo",
        "Paris",
        "Sydney",
        "Berlin",
        "Moscow",
        "Cairo",
        "Mumbai",
        "São Paulo",
        "Toronto",
        "Dubai",
        "Singapore",
        "Bangkok",
        "Rome",
        "Madrid",
        "Los Angeles",
        "Chicago",
        "Mexico City",
        "Buenos Aires",
    ].map { City(name: $0) }

    var body: some View {
        List(cities) { city in
            VStack(alignment: .leading) {
                NavigationLink(value: city) {
                    Text(city.name)
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle("Cities")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CityView: View {
    let city: City
    var body: some View {
        ScrollView(.vertical) {
            Text("Hello")
        }
        .navigationTitle(city.name)
        .navigationBarTitleDisplayMode(.inline)
        .containerBackground(Color.clear, for: .navigation)
    }
}

#Preview {
    StuckViewInBackgroundDuringNavStackTransitionExample()
}
