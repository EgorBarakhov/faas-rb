# frozen_string_literal: true

module Types
  module Payloads
    class Authenticate < Types::BaseObject
      field :access_token, String, null: false, deprecation_reason: 'Parse from HTTP Responce header'
      field :user, Types::UserType, null: false
    end
  end
end
