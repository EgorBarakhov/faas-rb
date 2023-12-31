# frozen_string_literal: true

module Types
  module Inputs
    class Authenticate < Types::BaseInputObject
      argument :eth_account, String, required: true, description: 'ETH account address'
      argument :message, String, required: true,
        description: 'One-time nonce generated by `generateNonce` mutation'
      argument :signature, String, required: true, description: '`message` signed by MetaMask'
    end
  end
end
