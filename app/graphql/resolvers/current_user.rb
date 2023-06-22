# frozen_string_literal: true

module Resolvers
  class CurrentUser < BaseResolver
    include AuthenticableGraphqlUser

    type Types::UserType, null: true

    def resolve
      current_user
    end
  end
end
