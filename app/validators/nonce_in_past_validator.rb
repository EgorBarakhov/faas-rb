# frozen_string_literal: true

class NonceInPastValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, _value)
    record.errors.add(attribute, :in_future) if record.nonce_generated_at.future?
  end
end
