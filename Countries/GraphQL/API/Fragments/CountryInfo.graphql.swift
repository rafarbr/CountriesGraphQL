// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension API {
  struct CountryInfo: API.SelectionSet, Fragment {
    public static var fragmentDefinition: StaticString { """
      fragment CountryInfo on Country {
        __typename
        name
        code
        emoji
        capital
        native
      }
      """ }

    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ApolloAPI.ParentType { API.Objects.Country }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("name", String.self),
      .field("code", API.ID.self),
      .field("emoji", String.self),
      .field("capital", String?.self),
      .field("native", String.self),
    ] }

    public var name: String { __data["name"] }
    public var code: API.ID { __data["code"] }
    public var emoji: String { __data["emoji"] }
    public var capital: String? { __data["capital"] }
    public var native: String { __data["native"] }
  }

}