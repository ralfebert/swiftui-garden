// » SwiftUI Garden
// » https://swiftui-garden.com/Misc/iOS-26/Overlapping-text-for-pinned-section-headers
// » https://github.com/ralfebert/swiftui-garden/blob/main/Snippets/ListPinnedSectionHeadersExample.swift

// SwiftUI Garden, https://swiftui-garden.com/

import SwiftUI

struct CityCountry {
    let name: String
    let continent: String

    static let data = [
        // Europe
        CityCountry(name: "London, United Kingdom", continent: "Europe"),
        CityCountry(name: "Paris, France", continent: "Europe"),
        CityCountry(name: "Berlin, Germany", continent: "Europe"),
        CityCountry(name: "Rome, Italy", continent: "Europe"),
        CityCountry(name: "Madrid, Spain", continent: "Europe"),
        CityCountry(name: "Amsterdam, Netherlands", continent: "Europe"),

        // Asia
        CityCountry(name: "Tokyo, Japan", continent: "Asia"),
        CityCountry(name: "Beijing, China", continent: "Asia"),
        CityCountry(name: "Seoul, South Korea", continent: "Asia"),
        CityCountry(name: "Bangkok, Thailand", continent: "Asia"),
        CityCountry(name: "Singapore, Singapore", continent: "Asia"),
        CityCountry(name: "Mumbai, India", continent: "Asia"),

        // North America
        CityCountry(name: "New York, USA", continent: "North America"),
        CityCountry(name: "Los Angeles, USA", continent: "North America"),
        CityCountry(name: "Toronto, Canada", continent: "North America"),
        CityCountry(name: "Mexico City, Mexico", continent: "North America"),
        CityCountry(name: "Vancouver, Canada", continent: "North America"),

        // South America
        CityCountry(name: "São Paulo, Brazil", continent: "South America"),
        CityCountry(name: "Buenos Aires, Argentina", continent: "South America"),
        CityCountry(name: "Lima, Peru", continent: "South America"),

        // Africa
        CityCountry(name: "Cairo, Egypt", continent: "Africa"),
        CityCountry(name: "Cape Town, South Africa", continent: "Africa"),
    ]
}

struct ListPinnedSectionHeadersExample: View {
    private let groupedCities = Dictionary(grouping: CityCountry.data, by: { $0.continent })
        .mapValues { $0.sorted { $0.name < $1.name } }

    var body: some View {
        NavigationStack {
            List {
                ForEach(groupedCities.keys.sorted(), id: \.self) { continent in
                    Section(header: Text(continent)) {
                        ForEach(groupedCities[continent] ?? [], id: \.name) { city in
                            Text(city.name)
                                .padding(.vertical, 4)
                        }
                    }
                }
            }
            .listStyle(.plain)
            .scrollEdgeEffectStyle(.hard, for: .top)
            .navigationTitle("Cities & Countries")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ListPinnedSectionHeadersExample()
}
