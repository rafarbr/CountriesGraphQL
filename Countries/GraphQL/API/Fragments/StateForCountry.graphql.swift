// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension API {
  struct StateForCountry: API.SelectionSet, Fragment {
    public static var fragmentDefinition: StaticString { """
      fragment StateForCountry on State {
        __typename
        code
        name
      }
      """ }

    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ApolloAPI.ParentType { API.Objects.State }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("code", String?.self),
      .field("name", String.self),
    ] }

    public var code: String? { __data["code"] }
    public var name: String { __data["name"] }
  }

}