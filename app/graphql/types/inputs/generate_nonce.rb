# frozen_string_literal: true

module Types
  module Inputs
    class GenerateNonce < Types::BaseInputObject
      argument :eth_account, Types::Scalars::EthAddress, required: true, description: 'ETH account address'
    end
  end
end
