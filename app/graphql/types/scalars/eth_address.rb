# frozen_string_literal: true

module Types
  module Scalars
    class EthAddress < BaseScalar
      description 'String representing ETH address with or without `0x` prefix, checksummed or not'

      def self.coerce_input(value, _context)
        Eth::Address.new(value).address
      rescue Eth::Address::CheckSumError => _e
        raise GraphQL::CoercionError, "#{value.inspect} is not a valid address"
      end

      def self.coerce_result(value, _context)
        value.to_s
      end
    end
  end
end
