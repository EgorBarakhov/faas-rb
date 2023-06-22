# frozen_string_literal: true

module Types
  class TriggerPreviewType < Types::BaseObject
    field :id, Integer, null: false
    field :url, Scalars::Url, null: false
    field :is_active, Boolean, null: false
    field :token, String, null: false
    field :limit, GraphQL::Types::BigInt, null: false
    field :eth_address, Scalars::EthAddress, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
