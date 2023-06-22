# frozen_string_literal: true

module Mutations
  class CreateFunction < BaseMutation
    description "Create new function. Eth payment required"

    argument :input, Types::Inputs::CreateFunction

    type Types::Payloads::CreateFunction

    def resolve(input:)
      @params = input.to_h

      create_function.success? ? create_function.user : execution_error(error_data: create_function.error_data)
    end

    private

    attr_reader :params

    def create_function
      @create_function ||= ::CreateFunction.call(params:)
    end
  end
end
