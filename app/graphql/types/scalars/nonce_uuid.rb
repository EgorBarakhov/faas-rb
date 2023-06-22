# frozen_string_literal: true

module Types
  module Scalars
    class NonceUuid < BaseScalar
      include UUIDTools

      description 'String representing UUID for nonce. Returns `null` if UUID is expired (after 1 minute)'

      def self.coerce_input(value, _context)
        UUID.parse(value).to_s
      rescue TypeError => _e
        raise GraphQL::CoercionError, "#{value.inspect} is not a valid UUID"
      end

      def self.coerce_result(value, _context)
        uuid = UUID.parse(value)
        return uuid.to_s if uuid.timestamp + ::User::NONCE_EXPIRATION > Time.zone.now
      rescue TypeError => _e
        nil
      end
    end
  end
end
