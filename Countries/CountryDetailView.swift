//
//  CountryDetailView.swift
//  Countries
//
//  Created by Raphael Bernardes Rosa on 18/01/23.
//

import SwiftUI

struct CountryDetailView: View {

    let country: CountryViewModel
    @StateObject private var countryDetailVM = CountryDetailViewModel()

    var body: some View {
        VStack {
            Text(countryDetailVM.name)
            Text(countryDetailVM.capital)
            List(countryDetailVM.states, id: \.name) { state in
                Text(state.name)
            }
            .listStyle(PlainListStyle())
        }
        .onAppear {
            countryDetailVM.getCountryDetailByCode(country.code)
        }
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(country: CountryViewModel.defaultCountry)
    }
}
