# frozen_string_literal: true

module Types
  class FunctionPreviewType < Types::BaseObject
    field :id, Integer, null: false
    field :title, String, null: false
    field :description, String, null: false
    field :is_active, Boolean, null: false
    field :eth_address, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
