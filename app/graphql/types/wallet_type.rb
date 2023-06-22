# frozen_string_literal: true

module Types
  class WalletType < Types::BaseObject
    field :amount, Float, null: false
  end
end
