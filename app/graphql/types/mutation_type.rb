# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :generate_nonce, mutation: Mutations::GenerateNonce
    field :create_function, mutation: Mutations::CreateFunction
    field :authenticate, mutation: Mutations::Authenticate
    field :create_trigger, mutation: Mutations::CreateTrigger
    field :create_webhook, mutation: Mutations::CreateWebhook
  end
end
