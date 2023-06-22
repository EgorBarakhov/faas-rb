# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, Integer, null: false

    field :eth_account, String, null: false, description: 'ETH account address'
  end
end
