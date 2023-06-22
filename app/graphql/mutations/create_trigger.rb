# frozen_string_literal: true

module Mutations
  class CreateTrigger < BaseMutation
    argument :input, Types::Inputs::CreateTrigger

    type Types::Payloads::CreateTrigger

    def resolve(input:)
      @params = input.to_h

      create_trigger.success? ? create_trigger.user : execution_error(error_data: create_trigger.error_data)
    end

    private

    attr_reader :params

    def create_trigger
      @create_trigger ||= ::CreateTrigger.call(params:)
    end
  end
end
