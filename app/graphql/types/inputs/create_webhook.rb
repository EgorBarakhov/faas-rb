# frozen_string_literal: true

module Types
  module Inputs
    class CreateWebhook < Types::BaseInputObject
      argument :function_id, Integer, required: true
	    argument :url, String, required: true
		  argument :token, String, required: false
    end
  end
end
