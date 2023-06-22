# frozen_string_literal: true

module Types
  module Payloads
    class GenerateNonce < Types::BaseObject
      # field :eth_account, Types::Scalars::EthAddress, null: false, description: 'ETH account address'
      # field :nonce, Types::Scalars::NonceUuid, null: true, description: 'One-time nonce'

      field :eth_account, String, null: false, description: 'ETH account address'
      field :nonce, String, null: true, description: 'One-time nonce'
    end
  end
end
