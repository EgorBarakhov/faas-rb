# frozen_string_literal: true

module Mutations
  class GenerateNonce < BaseMutation
    description "Generate nonce for user's ETH account. Return old nonce if it was generated less than 10 seconds ago"

    argument :input, Types::Inputs::GenerateNonce

    type Types::Payloads::GenerateNonce

    def resolve(input:)
      @params = input.to_h

      generate_nonce.success? ? generate_nonce.user : execution_error(error_data: generate_nonce.error_data)
    end

    private

    attr_reader :params

    def generate_nonce
      @generate_nonce ||= ::GenerateNonce.call(params:)
    end
  end
end
