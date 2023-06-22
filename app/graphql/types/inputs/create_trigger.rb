# frozen_string_literal: true

module Types
  module Inputs
    class CreateTrigger < Types::BaseInputObject
      argument :function_id, Integer, required: true
	    argument :limit, Integer, required: true
		  argument :token, String, required: true
    end
  end
end
