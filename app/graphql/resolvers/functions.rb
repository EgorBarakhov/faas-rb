# frozen_string_literal: true

module Resolvers
  class Functions < BaseResolver
    # include AuthenticableGraphqlUser

    type [Types::FunctionPreviewType], null: true

    def resolve
      current_user.functions
    end
  end
end
