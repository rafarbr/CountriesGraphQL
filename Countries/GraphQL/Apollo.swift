//
//  Apollo.swift
//  Countries
//
//  Created by Raphael Bernardes Rosa on 17/01/23.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
    lazy var apollo = ApolloClient(url: URL(string: "https://countries.trevorblades.com/")!)

    private init() {}
}
