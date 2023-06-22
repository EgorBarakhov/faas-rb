# frozen_string_literal: true

class TriggerController < ApplicationController
  include AuthorizeTrigger

  def execute
    function = Trigger.find_by(params[:trigger_id]).function

    ::Functions::Execute(function: function)
  end
end