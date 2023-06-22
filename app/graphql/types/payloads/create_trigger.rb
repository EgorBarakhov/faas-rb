# frozen_string_literal: true

module Types
  module Payloads
    class CreateTrigger < Types::BaseObject
      field :function, Types::FunctionType, null: false
    end
  end
end
