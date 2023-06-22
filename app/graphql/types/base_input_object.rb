# frozen_string_literal: true

module Types
  class BaseInputObject < GraphQL::Schema::InputObject
    argument_class Types::BaseArgument

    def self.default_graphql_name
      @default_graphql_name ||= name.split('::')[1..].join
    end
  end
end
