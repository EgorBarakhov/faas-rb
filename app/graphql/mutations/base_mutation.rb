# frozen_string_literal: true

module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    include ActionPolicy::GraphQL::Behaviour
    include ExecutionErrorResponder

    argument_class Types::BaseArgument
    field_class Types::BaseField
    # Use it for GraphQL::Schema::RelayClassicMutation
    # input_object_class Types::BaseInputObject
    object_class Types::BaseObject

    private

    def auth_headers_from(data)
      context[:set_headers] = {
        'access-token' => data.access_token
      }
    end

    def current_user
      @current_user ||= context[:current_user]
    end
  end
end
