# frozen_string_literal: true

module Types
  module Inputs
    class CreateFunction < Types::BaseInputObject
      argument :title, String, required: true
	    argument :description, String, required: true
		  argument :rawData, String, required: true
    end
  end
end
