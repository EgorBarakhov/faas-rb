# frozen_string_literal: true

module Mutations
  class Authenticate < BaseMutation
    argument :input, Types::Inputs::Authenticate

    type Types::Payloads::Authenticate

    def resolve(input:)
      @params = input.to_h

      authenticate.success? ? authenticate.user : execution_error(error_data: authenticate.error_data)
    end

    private

    attr_reader :params

    def authenticate
      @authenticate ||= ::Authenticate.call(params:)
    end
  end
end
