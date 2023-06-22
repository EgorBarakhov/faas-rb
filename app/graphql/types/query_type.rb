# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :me, resolver: Resolvers::CurrentUser, null: true
    field :functions, resolver: Resolvers::Functions, null: false
    field :function, type: Types::FunctionType
    field :wallet, resolver: Resolvers::Wallet
  end
end
