//
//  CountryListViewModel.swift
//  Countries
//
//  Created by Raphael Bernardes Rosa on 18/01/23.
//

import Foundation
import Apollo

class CountryListViewModel: ObservableObject {

    @Published var countries: [CountryViewModel] = []

    func getAllCountries() {
        Network.shared.apollo.fetch(query: API.GetAllCountriesQuery()) { result in
            switch result {
            case .success(let graphQLResult):
                if let countries = graphQLResult.data?.countries {
                    DispatchQueue.main.async {
                        self.countries = countries.map(CountryViewModel.init)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }

}

struct CountryViewModel {
    fileprivate let country: API.GetAllCountriesQuery.Data.Country

    var code: String {
        country.code
    }

    var name: String {
        country.name
    }

    var emoji: String {
        country.emoji
    }
}

extension CountryViewModel {
    static var defaultCountry: CountryViewModel {
        CountryViewModel(
            country: API.GetAllCountriesQuery.Data.Country(
                data: .init(
                    [
                        "code": "US",
                        "name": "Any",
                        "emoji": "Any"
                    ],
                    variables: nil
                )
            )
        )
    }
}
