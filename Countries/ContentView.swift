//
//  ContentView.swift
//  Countries
//
//  Created by Raphael Bernardes Rosa on 17/01/23.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var countryListVM = CountryListViewModel()

    var body: some View {
        NavigationView {
            VStack {
                List(countryListVM.countries, id: \.code) { country in
                    NavigationLink(
                        destination: CountryDetailView(country: country)) {
                            HStack {
                                Text(country.emoji)
                                Text(country.name)
                            }
                        }
                }
                .listStyle(PlainListStyle())
            }
            .onAppear {
                countryListVM.getAllCountries()
            }
            .navigationTitle("Countries")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
