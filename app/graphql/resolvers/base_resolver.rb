# frozen_string_literal: true

module Resolvers
  class BaseResolver < GraphQL::Schema::Resolver
    include ActionPolicy::GraphQL::Behaviour
    include ExecutionErrorResponder

    argument_class Types::BaseArgument

    def resolve(**options)
      @options = options
      yield if block_given?
      fetch_data
    end

    private

    attr_reader :options

    def fetch_data
      raise NotImplementedError
    end

    def current_user
      @current_user ||= context[:current_user]
    end
  end
end
