# frozen_string_literal: true

module Mutations
  class CreateWebhook < BaseMutation
    argument :input, Types::Inputs::CreateWebhook

    type Types::Payloads::CreateWebhook

    def resolve(input:)
      @params = input.to_h

      create_webhook.success? ? create_webhook.user : execution_error(error_data: create_webhook.error_data)
    end

    private

    attr_reader :params

    def create_webhook
      @create_webhook ||= ::CreateWebhook.call(params:)
    end
  end
end
