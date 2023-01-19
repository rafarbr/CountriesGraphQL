//
//  CountryDetailViewModel.swift
//  Countries
//
//  Created by Raphael Bernardes Rosa on 18/01/23.
//

import Foundation
import Apollo

class CountryDetailViewModel: ObservableObject {

    @Published private var country: API.GetCountryInfoByCodeQuery.Data.Country?

    var name: String {
        country?.name ?? ""
    }

    var capital: String {
        country?.capital ?? ""
    }

    var states: [StateViewModel] {
        country?.states.map(StateViewModel.init) ?? []
    }

    func getCountryDetailByCode(_ code: API.ID) {
        Network.shared.apollo.fetch(query: API.GetCountryInfoByCodeQuery(code: code)) { result in
            switch result {
            case .success(let graphQLResult):
                DispatchQueue.main.async {
                    self.country = graphQLResult.data?.country
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct StateViewModel: Identifiable {

    fileprivate let state: API.GetCountryInfoByCodeQuery.Data.Country.State

    let id = UUID()

    var name: String {
        state.name
    }
}
