# frozen_string_literal: true

module Types
  class FunctionType < FunctionPreviewType
    field :rawData, String, null: false
    field :triggers, [Types::TriggerPreviewType], null: false
    field :webhooks, [Types::WebhookPreviewType], null: false
  end
end
