// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension API {
  class GetAllCountriesQuery: GraphQLQuery {
    public static let operationName: String = "GetAllCountries"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query GetAllCountries {
          countries {
            __typename
            ...CountryInfo
            states {
              __typename
              ...StateForCountry
            }
          }
        }
        """#,
        fragments: [CountryInfo.self, StateForCountry.self]
      ))

    public init() {}

    public struct Data: API.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ApolloAPI.ParentType { API.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("countries", [Country].self),
      ] }

      public var countries: [Country] { __data["countries"] }

      /// Country
      ///
      /// Parent Type: `Country`
      public struct Country: API.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { API.Objects.Country }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("states", [State].self),
          .fragment(CountryInfo.self),
        ] }

        public var states: [State] { __data["states"] }
        public var name: String { __data["name"] }
        public var code: API.ID { __data["code"] }
        public var emoji: String { __data["emoji"] }
        public var capital: String? { __data["capital"] }
        public var native: String { __data["native"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public var countryInfo: CountryInfo { _toFragment() }
        }

        /// Country.State
        ///
        /// Parent Type: `State`
        public struct State: API.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { API.Objects.State }
          public static var __selections: [ApolloAPI.Selection] { [
            .fragment(StateForCountry.self),
          ] }

          public var code: String? { __data["code"] }
          public var name: String { __data["name"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public var stateForCountry: StateForCountry { _toFragment() }
          }
        }
      }
    }
  }

}