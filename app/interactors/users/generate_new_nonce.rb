# frozen_string_literal: true

module Users
  class GenerateNewNonce
    include Interactor
    include UUIDTools

    delegate :user, to: :context

    before do
      context.user_params ||= {}
    end

    def call
      context.user_params.merge!(nonce:)
    end

    private

    def nonce
      user.allowed_to_update_nonce? ? new_nonce : user.nonce
    end

    def new_nonce
      UUID.timestamp_create
    end
  end
end
