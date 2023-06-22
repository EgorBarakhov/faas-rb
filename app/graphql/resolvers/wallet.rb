# frozen_string_literal: true

module Resolvers
  class Wallet < BaseResolver
    # include AuthenticableGraphqlUser

    type Types::WalletType, null: false

    def resolve
      current_user.wallet
    end
  end
end
